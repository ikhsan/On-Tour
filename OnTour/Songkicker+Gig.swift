
import SwiftyJSON

typealias ResultGig = Result<[Gig], SongkickerError>

extension Parser {
    
    static func parseGigs(json: JSON) -> ResultGig {

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

    class func gigs(artist: Artist, page: Int, completionHandler: (ResultGig) -> Void) {
        let param = ["per_page" : 15]
        
        kick("artists/\(artist.id)/calendar.json", additionalParameters: param) { result in
            switch result {
            case .Failure(let error): completionHandler(.Failure(error))
                
            case .Success(let json):
                let json = JSON(json)
                let result = Parser.parseGigs(json)
                completionHandler(result)
            }
        }
    }
    
}
