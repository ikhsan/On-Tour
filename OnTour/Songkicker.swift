//
//  Songkicker.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
}

enum SongkickerError : ErrorType {
    case ConfigurationError
    case NetworkError
    case ParsingError(String)
}

class Songkicker {
    static var base = ""
    static var apikey = ""
    
    class func configureBase(base: String, apikey: String) {
        self.base = base
        self.apikey = apikey
    }
    
    class func kick(path: String, additionalParameters: [String: AnyObject]?, completionHandler: (Result<[String: AnyObject], SongkickerError>) -> Void) {
        
        guard base != "" && apikey != "" else {
            completionHandler(.Failure(.ConfigurationError))
            return
        }
        
        // use base url & apikey params
        let URLString = base.stringByAppendingPathComponent(path)
        var params = (additionalParameters != nil) ? additionalParameters! : [:]
        params["apikey"] = apikey
        
        // alamo wrapper
        Alamofire
            .request(.GET, URLString: URLString, parameters: params, encoding: .URL)
//            .responseString { (_, _, string, _) -> Void in
//                print(string)
//            }
            .responseJSON { (_, _, object, _) -> Void in
                if let json = object as! [String: AnyObject]? {
                    completionHandler(.Success(json))
                } else {
                    completionHandler(.Failure(.NetworkError))
                }
            }
    }
}
