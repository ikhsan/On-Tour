//
//  ParserArtistTests.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/21/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import OnTour

func parseString(string: String) -> JSON {
    let responseData = string.dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    let json = try! NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments)
    return JSON(json)
}

class ParserArtistTests: XCTestCase {
    
    let artistsString = "{\"resultsPage\":{\"status\":\"ok\",\"results\":{\"artist\":[{\"identifier\":[{\"mbid\":\"e50ef105-5dce-4d2c-967e-9661b1bc09e2\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:e50ef105-5dce-4d2c-967e-9661b1bc09e2.json\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:e50ef105-5dce-4d2c-967e-9661b1bc09e2/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:e50ef105-5dce-4d2c-967e-9661b1bc09e2/setlists.json\"},{\"mbid\":\"9eb776d0-523f-4994-9b9f-71b88b0a51e9\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:9eb776d0-523f-4994-9b9f-71b88b0a51e9.json\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:9eb776d0-523f-4994-9b9f-71b88b0a51e9/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:9eb776d0-523f-4994-9b9f-71b88b0a51e9/setlists.json\"},{\"mbid\":\"7a7b70f3-1d6f-40f1-8c55-f75a376bee87\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:7a7b70f3-1d6f-40f1-8c55-f75a376bee87.json\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:7a7b70f3-1d6f-40f1-8c55-f75a376bee87/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:7a7b70f3-1d6f-40f1-8c55-f75a376bee87/setlists.json\"},{\"mbid\":\"d8d6420d-35d8-4dfe-ba85-2df0d78b28f2\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:d8d6420d-35d8-4dfe-ba85-2df0d78b28f2.json\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:d8d6420d-35d8-4dfe-ba85-2df0d78b28f2/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:d8d6420d-35d8-4dfe-ba85-2df0d78b28f2/setlists.json\"},{\"mbid\":\"8c5bc1f3-1ead-4b86-a1a7-b6e0517b28c6\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:8c5bc1f3-1ead-4b86-a1a7-b6e0517b28c6.json\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:8c5bc1f3-1ead-4b86-a1a7-b6e0517b28c6/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:8c5bc1f3-1ead-4b86-a1a7-b6e0517b28c6/setlists.json\"}],\"displayName\":\"Fireworks\",\"onTourUntil\":\"2015-08-25\",\"uri\":\"http://www.songkick.com/artists/341024-fireworks?utm_source=26333&utm_medium=partner\",\"id\":341024},{\"onTourUntil\":null,\"identifier\":[{\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:a342cb92-3368-420a-bc50-ac500831c622/setlists.json\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:a342cb92-3368-420a-bc50-ac500831c622.json\",\"mbid\":\"a342cb92-3368-420a-bc50-ac500831c622\",\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:a342cb92-3368-420a-bc50-ac500831c622/calendar.json\"}],\"uri\":\"http://www.songkick.com/artists/519368-fireworks-night?utm_source=26333&utm_medium=partner\",\"id\":519368,\"displayName\":\"Fireworks Night\"},{\"onTourUntil\":null,\"displayName\":\"Fireworks for Today\",\"uri\":\"http://www.songkick.com/artists/5272113-fireworks-for-today?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":5272113},{\"identifier\":[{\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:f6f44ebd-5d0f-4cfc-96d8-1ec5d7fc805c/calendar.json\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:f6f44ebd-5d0f-4cfc-96d8-1ec5d7fc805c.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:f6f44ebd-5d0f-4cfc-96d8-1ec5d7fc805c/setlists.json\",\"mbid\":\"f6f44ebd-5d0f-4cfc-96d8-1ec5d7fc805c\"}],\"displayName\":\"There Will Be Fireworks\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/2346585-there-will-be-fireworks?utm_source=26333&utm_medium=partner\",\"id\":2346585},{\"identifier\":[],\"displayName\":\"The Fireworks (UK)\",\"onTourUntil\":\"2015-07-24\",\"uri\":\"http://www.songkick.com/artists/6741924-fireworks-uk?utm_source=26333&utm_medium=partner\",\"id\":6741924},{\"onTourUntil\":\"2015-07-25\",\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/2841151-fireworks-of-rock?utm_source=26333&utm_medium=partner\",\"id\":2841151,\"displayName\":\"Fireworks of Rock\"},{\"displayName\":\"Fireworks Display\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/2341626-fireworks-display?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":2341626},{\"onTourUntil\":null,\"displayName\":\"Electric Fireworks\",\"uri\":\"http://www.songkick.com/artists/4773673-electric-fireworks?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":4773673},{\"onTourUntil\":null,\"displayName\":\"Daylight Fireworks\",\"uri\":\"http://www.songkick.com/artists/3462041-daylight-fireworks?utm_source=26333&utm_medium=partner\",\"id\":3462041,\"identifier\":[]},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/856229-indoor-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"Indoor Fireworks\",\"id\":856229},{\"identifier\":[],\"onTourUntil\":null,\"displayName\":\"Fireworks at 22.45\",\"uri\":\"http://www.songkick.com/artists/5529403-fireworks-at-2245?utm_source=26333&utm_medium=partner\",\"id\":5529403},{\"displayName\":\"4th of July Fireworks\",\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/2331649-4th-of-july-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"id\":2331649},{\"displayName\":\"Fireworks Factory\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/5850259-fireworks-factory?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":5850259},{\"identifier\":[],\"onTourUntil\":null,\"displayName\":\"Music for the Royal Fireworks\",\"uri\":\"http://www.songkick.com/artists/3526131-music-for-the-royal-fireworks?utm_source=26333&utm_medium=partner\",\"id\":3526131},{\"displayName\":\"Fireworks Over London\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/4516143-fireworks-over-london?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":4516143},{\"onTourUntil\":null,\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/5055618-fireworks-quebec?utm_source=26333&utm_medium=partner\",\"id\":5055618,\"displayName\":\"Fire/Works (Quebec)\"},{\"identifier\":[],\"displayName\":\"Tchaikovsky Spectacular with fireworks\",\"uri\":\"http://www.songkick.com/artists/7108819-tchaikovsky-spectacular-with-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"id\":7108819},{\"identifier\":[],\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/4511618-how-the-fireworks?utm_source=26333&utm_medium=partner\",\"displayName\":\"How the Fireworks\",\"id\":4511618},{\"identifier\":[],\"onTourUntil\":null,\"displayName\":\"Forest Fireworks\",\"uri\":\"http://www.songkick.com/artists/4962293-forest-fireworks?utm_source=26333&utm_medium=partner\",\"id\":4962293},{\"onTourUntil\":null,\"displayName\":\"Fireworks Ensemble\",\"uri\":\"http://www.songkick.com/artists/4891113-fireworks-ensemble?utm_source=26333&utm_medium=partner\",\"identifier\":[{\"eventsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:58a3bde2-4d07-44aa-ac52-c0db1544a4b6/calendar.json\",\"setlistsHref\":\"http://api.songkick.com/api/3.0/artists/mbid:58a3bde2-4d07-44aa-ac52-c0db1544a4b6/setlists.json\",\"mbid\":\"58a3bde2-4d07-44aa-ac52-c0db1544a4b6\",\"href\":\"http://api.songkick.com/api/3.0/artists/mbid:58a3bde2-4d07-44aa-ac52-c0db1544a4b6.json\"}],\"id\":4891113},{\"onTourUntil\":null,\"displayName\":\"Ghosts of Fireworks\",\"uri\":\"http://www.songkick.com/artists/3828126-ghosts-of-fireworks?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":3828126},{\"identifier\":[],\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/5136543-fun-with-fireworks?utm_source=26333&utm_medium=partner\",\"displayName\":\"Fun With Fireworks\",\"id\":5136543},{\"onTourUntil\":null,\"displayName\":\"Watch the Fireworks\",\"uri\":\"http://www.songkick.com/artists/4049846-watch-the-fireworks?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":4049846},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/2017072-just-watch-the-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"Just Watch The Fireworks\",\"id\":2017072},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/3585136-kid-is-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"The Kid Is Fireworks\",\"id\":3585136},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/1041401-chinese-fireworks-co?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"The Chinese Fireworks Co.\",\"id\":1041401},{\"displayName\":\"SYAHARANI & THE QUEEN FIREWORKS\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/5960549-syaharani-and-the-queen-fireworks?utm_source=26333&utm_medium=partner\",\"identifier\":[],\"id\":5960549},{\"displayName\":\"Fireworks (replacing Defeater)\",\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/7768469-fireworks-replacing-defeater?utm_source=26333&utm_medium=partner\",\"id\":7768469,\"onTourUntil\":null},{\"identifier\":[],\"displayName\":\"James Lesslie (Fireworks Night)\",\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/8281363-james-lesslie-fireworks-night?utm_source=26333&utm_medium=partner\",\"id\":8281363},{\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/3792961-amsterdam-play-peles-albulm-fireworks?utm_source=26333&utm_medium=partner\",\"displayName\":\"Amsterdam Play Peles Albulm Fireworks\",\"identifier\":[],\"id\":3792961},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/2335509-wours-fireworks-over-central-new-york?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"WOUR\'s Fireworks Over Central New York\",\"id\":2335509},{\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/2398828-radio-disney-4th-of-july-fireworks-spectacular?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"displayName\":\"Radio Disney 4th of July Fireworks Spectacular\",\"id\":2398828},{\"displayName\":\"Tease Tuesday Burlesque: Other Than Fireworks!\",\"identifier\":[],\"uri\":\"http://www.songkick.com/artists/8239628-tease-tuesday-burlesque-other-than-fireworks?utm_source=26333&utm_medium=partner\",\"onTourUntil\":null,\"id\":8239628},{\"identifier\":[],\"onTourUntil\":null,\"uri\":\"http://www.songkick.com/artists/5519678-livermore-4th-fireworks-event-sponsored-by-floratech-landscape-management?utm_source=26333&utm_medium=partner\",\"displayName\":\"Livermore 4th Fireworks Event Sponsored By Floratech Landscape Management\",\"id\":5519678}]},\"perPage\":50,\"page\":1,\"totalEntries\":34}}"
    let errorString = "{\"resultsPage\":{\"status\":\"error\",\"error\":{\"message\":\"Resource not found\"}}}"
    
    var json: JSON { return parseString(artistsString) }
    var errorJSON: JSON { return parseString(errorString) }
    
    func testParseInvalidResponseShouldReturnError() {
        let result = Parser.parseArtists(errorJSON)
        
        switch result {
        case .Success(_): XCTFail("data should give an error")
            
        case .Failure(let error):
            switch error {
            case .ParsingError(let errorMessage):
                XCTAssertEqual("Resource not found", errorMessage)
            default:
                XCTAssert(false, "error should be parsing error")
            }
        }
    }
    
    func testParseArtistShouldHaveCorrectProperties() {
        let result = Parser.parseArtists(json)
        
        switch result {
        case .Failure(_): XCTFail("artists should have correct data")
            
        case .Success(let artists):
            let artist = artists.first!
            
            let expectedDate = "2015-08-25".sk_date()!
            
            XCTAssertEqual("341024", artist.id)
            XCTAssertEqual("Fireworks", artist.name)
            XCTAssertEqual(true, artist.onTour)
            XCTAssertEqual(expectedDate.timeIntervalSinceReferenceDate, artist.onTourDate!.timeIntervalSinceReferenceDate)
            XCTAssertEqual("http://www.songkick.com/artists/341024-fireworks?utm_source=26333&utm_medium=partner", artist.uri)
        }
    }
    
    func testParseArtistsShouldParseAllArtists() {
        let result = Parser.parseArtists(json)
        
        switch result {
        case .Failure(_): XCTFail("artists should have correct data")
            
        case .Success(let artists):
            XCTAssertEqual(34, artists.count)
        }
    }
    
}
