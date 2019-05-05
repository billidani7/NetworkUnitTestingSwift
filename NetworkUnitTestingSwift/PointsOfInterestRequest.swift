//
//  PointsOfInterestRequest.swift
//  NetworkUnitTesting
//
//  Created by Vasilis Daningelis on 5/5/19.
//  Copyright © 2019 Vasilis Daningelis. All rights reserved.
//

import Foundation
import CoreLocation

struct PointsOfInterestRequest: APIRequest {
    
    func makeRequest(from coordinate: CLLocationCoordinate2D) throws -> URLRequest {
        
        guard CLLocationCoordinate2DIsValid(coordinate) else {
            throw RequestError.invalidCoordinate
        }

        var components = URLComponents(string: "https://example.com/locations")!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(coordinate.latitude)"),
            URLQueryItem(name: "long", value: "\(coordinate.longitude)")
        ]
        return URLRequest(url: components.url!)
    }
    
    func parseResponse(data: Data) throws -> [PointOfInterest] {
        return try JSONDecoder().decode([PointOfInterest].self, from: data)
    }

}

enum RequestError: Error {
    case invalidCoordinate
}

