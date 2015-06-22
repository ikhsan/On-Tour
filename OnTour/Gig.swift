//
//  Gig.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import Foundation
import MapKit

class Gig {
    let gigId: Int
    let name: String
    let uri: String
    let date: NSDate
    let venue: String
    let coordinate: CLLocationCoordinate2D
    
    init(gigId: Int, name: String, uri: String, date: NSDate, venue: String, coordinate: CLLocationCoordinate2D) {
        self.gigId = gigId
        self.name = name
        self.uri = uri
        self.date = date
        self.venue = venue
        self.coordinate = coordinate
    }
}
