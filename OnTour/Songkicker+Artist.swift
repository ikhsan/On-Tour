
import SwiftyJSON

typealias ResultArtist = Result<[Artist], SongkickerError>

extension Parser {
    
    static func parseArtists(json: JSON) -> ResultArtist {
        
        guard validate(json), let artistsJSON = json["resultsPage"]["results"]["artist"].array else {
            let status = json["resultsPage"]["error"]["message"].stringValue
            let error = SongkickerError.ParsingError(status)
            return .Failure(error)
        }
        
        let artists = artistsJSON.map { Artist(json: $0) }
        return .Success(artists)
    }
    
}

extension Songkicker {
    
    class func image(artist: Artist, completionHandler: (UIImage) -> Void) {
        let fullpath = "https://ssl.sk-static.com/images/media/profile_images/artists/\(artist.id)/col6"
        let defaultImage = UIImage(named: "songkick-background")!
        
        kickData(fullpath) { result in
            switch result {
            case .Failure(_): completionHandler(defaultImage)
                
            case .Success(let data):
                let image = UIImage(data: data) ?? defaultImage
                completionHandler(image)
            }
        }
    }
    
    class func searchArtist(name: String, page: Int = 1, completionHandler: (ResultArtist) -> Void) {
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
    
    class func similar(artist: Artist, completionHandler: (ResultArtist) -> Void) {
        kick("artists/\(artist.id)/similar_artists.json") { result in
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
