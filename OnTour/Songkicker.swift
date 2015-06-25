
import Foundation
import Alamofire

enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
}

enum SongkickerError : ErrorType {
    case ConfigurationError
    case NetworkError
    case ParsingDataError
    case EmptySetError
    case ParsingError(String)
}

class Songkicker {
    static var base = ""
    static var apikey = ""
    
    class func configureBase(base: String, apikey: String) {
        self.base = base
        self.apikey = apikey
    }
    
    class func kick(path: String, additionalParameters: [String: AnyObject] = ["page": 1], completionHandler: (Result<[String: AnyObject], SongkickerError>) -> Void) {
        
        guard base != "" && apikey != "" else {
            completionHandler(.Failure(.ConfigurationError))
            return
        }
        
        // use base url & apikey params
        let URLString = base.stringByAppendingPathComponent(path)
        var params = additionalParameters
        params["apikey"] = apikey
        
        // alamo wrapper
        Alamofire
        .request(.GET, URLString: URLString, parameters: params, encoding: .URL)
        .responseJSON { (_, _, object, _) -> Void in
            if let json = object as! [String: AnyObject]? {
                completionHandler(.Success(json))
            } else {
                completionHandler(.Failure(.NetworkError))
            }
        }
    }
    
    class func kickData(fullpath: String, completionHandler: (Result<NSData, SongkickerError>) -> Void) {
        Alamofire
        .request(.GET, URLString: fullpath, parameters: nil, encoding: .URL)
        .response { (_, _, anyobject, _) -> Void in
            if let data = anyobject as? NSData {
                completionHandler(.Success(data))
            } else {
                completionHandler(.Failure(.ParsingDataError))
            }
        }
    }
    
}
