//
//  GeoCurrentLocation.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Combine
import Foundation
import CoreLocation

final class GeoCurrentLocation {
    private let utility: GeoUtilityProtocol
    
    required init(utility: GeoUtilityProtocol = GeoUtility()) {
        self.utility = utility
    }
    
    func find() -> Future<CLLocation, Error> {
        return Future<CLLocation, Error> { promise in
            guard self.utility.authorizationStatusIsEnabled() else {
                return promise(.failure(RuntimeError("authorizationStatus is not authorizedWhenInUse or authorizedAlways")))
            }
            
            GeoSingleShotCallbackHelper().start { (location: CLLocation?, error: Error?) in
                if let error = error {
                    return promise(.failure(error))
                }
                guard let location = location else {
                    return promise(.failure(RuntimeError("Invalid location returned, nil is not a valid location.")))
                }
                return promise(.success(location))
            }
        }
    }
}
