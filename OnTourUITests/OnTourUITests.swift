//
//  OnTourUITests.swift
//  OnTourUITests
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import Foundation
import XCTest

@available(iOS 9.0, *)
class OnTourUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSearcArtist() {
        let app = XCUIApplication()
        let typeArtistSNameSearchField = app.searchFields["Type artist's name"]
        typeArtistSNameSearchField.typeText("Bad")
        app.buttons["Search"].tap()
        app.collectionViews.staticTexts["Bad Religion"].tap()        
    }
    
}
