//
//  GeoVisits.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Foundation
import CoreLocation

internal final class GeoVisits: NSObject, CLLocationManagerDelegate {
    private let manager: CLLocationManager
    private let utility: GeoUtilityProtocol
    
    required init(utility: GeoUtilityProtocol = GeoUtility()) {
        self.utility = utility
        manager = CLLocationManager()
        super.init()
        manager.delegate = self
    }
            
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

    }
}
