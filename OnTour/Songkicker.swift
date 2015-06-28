
import Foundation

enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
}

enum SongkickerError : ErrorType {
    case ConfigurationError
    case NetworkError
    case InvalidRequest
    case ParsingDataError
    case EmptySetError
    case ParsingError(String)
}

class Songkicker {
    typealias JSONDict = [String: AnyObject]
    
    static var base = ""
    static var apikey = ""
    
    class func configureBase(base: String, apikey: String) {
        self.base = base
        self.apikey = apikey
    }
    
    class func kick(path: String, additionalParameters: JSONDict = ["page": 1], completionHandler: (Result<JSONDict, SongkickerError>) -> Void) -> NSURLSessionDataTask? {
        
        guard base != "" && apikey != "" else {
            completionHandler(.Failure(.ConfigurationError))
            return nil
        }
        
        // use base url & apikey params
        let URLString = base.stringByAppendingPathComponent(path)
        var params = additionalParameters
        params["apikey"] = apikey
        
        // fetch
        let task = get(URLString, params: params) { data, error in
            guard let data = data else {
                completionHandler(.Failure(.NetworkError))
                return
            }
            
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! [String: AnyObject]
                completionHandler(.Success(JSON))
            } catch {
                completionHandler(.Failure(.NetworkError))
            }
        }
        task?.resume()
        
        return task
    }
    
    class func kickData(fullpath: String, completionHandler: (Result<NSData, SongkickerError>) -> Void) -> NSURLSessionDataTask? {
        let task = get(fullpath) { data, error in
            if let d = data {
                completionHandler(.Success(d))
            } else {
                completionHandler(.Failure(.ParsingDataError))
            }
        }
        task?.resume()
        
        return task
    }
    
}

extension Songkicker {
    
    class func get(urlString: String, params: JSONDict = [:], completionHandler: (NSData?, NSError?) -> Void) -> NSURLSessionDataTask? {
        
        guard let request = createRequest(urlString, params: params) else {
            return nil
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            NSOperationQueue.mainQueue().addOperationWithBlock { completionHandler(data, error) }
        }

        return task
    }
    
    class func createRequest(urlString: String, params: JSONDict = [:]) -> NSURLRequest? {
        guard let url = NSURL(string: urlString),
            let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        if (params.count > 0) {
            components.query = "&".join(params.map { "\($0)=\($1)" })
        }
        
        return NSURLRequest(URL: components.URL!)
    }
    
}