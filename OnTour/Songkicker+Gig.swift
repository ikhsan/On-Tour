
import SwiftyJSON

typealias ResultGigs = Result<[Gig], SongkickerError>

extension Parser {
    
    static func parseGigs(json: JSON) -> ResultGigs {

        guard validate(json), let gigsJSON = json["resultsPage"]["results"]["event"].array else {
            let status = json["resultsPage"]["error"]["message"].stringValue
            let error = SongkickerError.ParsingError(status)
            return .Failure(error)
        }

        let gigs = gigsJSON.map { Gig(json: $0) }
        return .Success(gigs)
    }
    
}

extension Songkicker {

    class func gigs(artist: Artist, page: Int, completionHandler: (ResultGigs) -> Void) {
        let param = ["per_page" : 15]
        
        kick("artists/\(artist.id)/calendar.json", additionalParameters: param) { result in
            let gigs = result.flatMap { Parser.parseGigs(JSON($0)) }
            completionHandler(gigs)
        }
    }
    
}
