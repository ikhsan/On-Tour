
import MapKit
import SwiftyJSON

class Gig : Decodeable {
    var id: Int
    var name: String
    var uri: String
    var date: NSDate?
    var venue: String
    var coordinate: CLLocationCoordinate2D?
    
    init(id: Int, name: String, uri: String, date: NSDate, venue: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.uri = uri
        self.date = date
        self.venue = venue
        self.coordinate = coordinate
    }

    required init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["displayName"].stringValue
        self.uri = json["uri"].stringValue
        self.date = json["start"]["date"].stringValue.sk_date()
        self.venue = json["venue"]["displayName"].stringValue
        
        if let lat = json["venue"]["lat"].double, let lng = json["venue"]["lng"].double {
            self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        }
    }
}