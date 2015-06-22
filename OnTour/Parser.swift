//
//  Parser.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/21/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

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