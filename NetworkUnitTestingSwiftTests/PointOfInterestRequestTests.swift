//
//  PointOfInterestRequestTests.swift
//  NetworkUnitTestingTests
//
//  Created by Vasilis Daningelis on 5/5/19.
//  Copyright © 2019 Vasilis Daningelis. All rights reserved.
//

import XCTest
import CoreLocation
@testable import NetworkUnitTestingSwift

class PointOfInterestRequestTests: XCTestCase {
    
    let request = PointsOfInterestRequest()
    
    func testMakingURLRequest() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 37.3293, longitude: -121.8893)
        let urlRequest = try request.makeRequest(from: coordinate)
        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "example.com")
        XCTAssertEqual(urlRequest.url?.query, "lat=37.3293&long=-121.8893")
    }
    
    func testParsingResponse() throws {
        let jsonData = "[{\"name\":\"My Location\"}]".data(using: .utf8)!
        let response = try request.parseResponse(data: jsonData)
        XCTAssertEqual(response, [PointOfInterest(name: "My Location")])
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}




