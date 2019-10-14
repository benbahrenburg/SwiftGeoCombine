//
//  GeoUtils.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Foundation
import CoreLocation

protocol GeoUtilityProtocol {
    func authorizationStatusIsEnabled() -> Bool
    func authorizedForBackground() -> Bool
}

struct GeoUtility: GeoUtilityProtocol {
    func authorizationStatusIsEnabled() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            return true
        }
        return false
    }
    
    func authorizedForBackground() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedAlways
    }
}
