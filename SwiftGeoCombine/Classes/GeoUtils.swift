//
//  GeoUtils.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Foundation
import CoreLocation

struct GeoUtils {
    func authorizationStatusIsEnabled() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            return true
        default:
            return false
        }
    }
}

