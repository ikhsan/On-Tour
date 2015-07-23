
import SwiftyJSON

typealias ResultArtists = Result<[Artist], SongkickerError>

extension Parser {
    
    static func parseArtists(json: JSON) -> ResultArtists {
        
        guard validate(json) else {
            let status = json["resultsPage"]["error"]["message"].stringValue
            return .Failure(.ParsingError(status))
        }
        
        guard let totalEntries = json["resultsPage"]["totalEntries"].int where totalEntries > 0 else {
            return .Failure(.EmptySetError)
        }
        
        guard let artistsJSON = json["resultsPage"]["results"]["artist"].array else {
            return .Failure(.ParsingDataError)
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
            case .Failure(_):
                completionHandler(defaultImage)
            case .Success(let data):
                let image = UIImage(data: data) ?? defaultImage
                completionHandler(image)
            }
        }
    }
    
    class func searchArtist(name: String, page: Int = 1, completionHandler: (ResultArtists) -> Void) {
        let params: [String: AnyObject] = ["query": name, "page": page]
        
        kick("search/artists.json", additionalParameters: params) { result in
            let artists = result.flatMap { Parser.parseArtists(JSON($0)) }
            completionHandler(artists)
        }
    }
    
    class func similar(artist: Artist, completionHandler: (ResultArtists) -> Void) {
        kick("artists/\(artist.id)/similar_artists.json") { result in
            let similar = result.flatMap { Parser.parseArtists(JSON($0)) }
            completionHandler(similar)
        }
    }
    
}
