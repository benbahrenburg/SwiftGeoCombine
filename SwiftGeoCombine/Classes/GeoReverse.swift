//
//  GeoReverse.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Combine
import Foundation
import CoreLocation

final class GeoReverse {
    private let utility: GeoUtilityProtocol
    
    required init(utility: GeoUtilityProtocol = GeoUtility()) {
        self.utility = utility
    }
    
    func find(latitude: Double, longitude: Double, locale: Locale = Locale.current) -> Future<[CLPlacemark]?, Error> {
        return Future<[CLPlacemark]?, Error> { promise in
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), preferredLocale: locale) { (placemark, error) in
                if let error = error {
                    return promise(.failure(error))
                }
                return promise(.success(placemark))
            }
        }
    }
}
