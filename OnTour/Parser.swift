
import Foundation
import SwiftyJSON

class Parser {
    class func validate(json: JSON) -> Bool {
        guard let status = json["resultsPage"]["status"].string else {
            return false
        }
        return status == "ok"
    }
}

extension String {
    
    private var formatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    func sk_date() -> NSDate? {
        return formatter.dateFromString(self)
    }
    
}