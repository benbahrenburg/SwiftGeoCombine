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

final class GeoCurrentLocationLookup: NSObject, CLLocationManagerDelegate {
    private let mgr: CLLocationManager
    private let locationPublisher: PassthroughSubject<CLLocation, Error>
    private var publisher: AnyPublisher<CLLocation, Error>
    private let utils: GeoUtils
    
    required init(utils: GeoUtils) {
        self.utils = utils
        mgr = CLLocationManager()
        locationPublisher = PassthroughSubject<CLLocation, Error>()
        publisher = locationPublisher.eraseToAnyPublisher()
        
        super.init()
        mgr.delegate = self
        setAccuracy(desiredAccuracy: kCLLocationAccuracyBest)
    }

    func setAccuracy(desiredAccuracy: CLLocationAccuracy) {
        mgr.desiredAccuracy = desiredAccuracy
    }
    
    func start() {
        guard utils.authorizationStatusIsEnabled() else {
            locationPublisher.send(completion: Subscribers.Completion.failure(RuntimeError("authorizationStatus is not authorizedWhenInUse or authorizedAlways")))
            return
        }
        mgr.requestLocation()
    }
    
    func stop() {
        mgr.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationPublisher.send(location)
            stop()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationPublisher.send(completion: Subscribers.Completion.failure(error))
        stop()
    }
}
