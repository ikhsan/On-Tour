//
//  Artist.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import Foundation
import SwiftyJSON

class Artist {
    let id: String
    let name: String
    var onTourDate: NSDate?
    var uri: String
    
    private var formatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    var onTour: Bool {
        guard let _ = onTourDate else {
            return false
        }
        return true
    }
    
    init(id: String, name: String, onTourDate: String, uri: String) {
        self.id = id
        self.name = name
        self.uri = uri
        self.onTourDate = formatter.dateFromString(onTourDate)
    }
}

extension Artist {
    class func fromJSON(json: JSON) -> Artist {
        let id = json["id"].stringValue
        let name = json["displayName"].stringValue
        let uri = json["uri"].stringValue
        
        let onTourDate = json["onTourUntil"].stringValue
        
        return Artist(id: id, name: name, onTourDate: onTourDate, uri: uri)
    }
}
