//
//  Array+Take.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/24/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import Foundation

extension Array {
    func take(uint: UInt) -> Array {
        let int = Int(uint)
        let bound = (int < self.count) ? int : self.count
        return Array(self[0..<bound])
    }
}
