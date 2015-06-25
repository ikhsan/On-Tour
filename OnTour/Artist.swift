
import SwiftyJSON

class Artist : Decodeable {
    var id: String
    var name: String
    var onTourDate: NSDate?
    var onTour: Bool { return (onTourDate != nil) }
    var uri: String
    
    init(id: String, name: String, onTourDate: String, uri: String) {
        self.id = id
        self.name = name
        self.uri = uri
        self.onTourDate = onTourDate.sk_date
    }

    required init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["displayName"].stringValue
        self.uri = json["uri"].stringValue
        self.onTourDate = json["onTourUntil"].string?.sk_date
    }
}
