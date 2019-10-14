//
//  GeoSingleShotCallbackHelper.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//


import Foundation
import CoreLocation

internal final class GeoSingleShotCallbackHelper: NSObject, CLLocationManagerDelegate {
    private var callback: ((CLLocation?, Error?) -> Void)?
    private let manager: CLLocationManager
    
    override init() {
        manager = CLLocationManager()
        super.init()
        manager.delegate = self
    }
    
    deinit {
        manager.stopUpdatingLocation()
    }
    
    func start(onComplete: @escaping ((CLLocation?, Error?) -> Void)) {
        self.callback = onComplete
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            if callback != nil {
                callback!(location, nil)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        if callback != nil {
            callback!(nil, error)
        }
    }
}
