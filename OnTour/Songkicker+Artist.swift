//
//  Songkicker+Artist.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import SwiftyJSON

typealias ResultArtist = Result<[Artist], SongkickerError>

extension Parser {
    
    static func parseArtists(json: JSON) -> ResultArtist {
        
        guard validate(json), let artistsJSON = json["resultsPage"]["results"]["artist"].array else {
            let status = json["resultsPage"]["error"]["message"].stringValue
            let error = SongkickerError.ParsingError(status)
            return .Failure(error)
        }
        
        let artists = artistsJSON.map { Artist.fromJSON($0) }
        return .Success(artists)
    }
    
}

extension Songkicker {
    
    class func searchArtist(name: String, page: Int, completionHandler: (ResultArtist) -> Void) {
        
        let params: [String: AnyObject] = ["query": name, "page": page]
        
        kick("search/artists.json", additionalParameters: params) { result in
            switch result {
            case .Failure(let error): completionHandler(.Failure(error))
                
            case .Success(let json):
                let json = JSON(json)
                let result = Parser.parseArtists(json)
                completionHandler(result)
            }
        }
    }
    
}
