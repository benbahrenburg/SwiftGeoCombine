//
//  GeoVisits.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Combine
import Foundation
import CoreLocation

internal final class GeoVisits: NSObject, CLLocationManagerDelegate {
    private let manager: CLLocationManager
    private let utility: GeoUtilityProtocol
    private let locationPublisher: PassthroughSubject<CLLocation, Error>
    
    var publisher: AnyPublisher<CLLocation, Error>
    
    required init(utility: GeoUtilityProtocol = GeoUtility()) {
        self.utility = utility
        manager = CLLocationManager()
        locationPublisher = PassthroughSubject<CLLocation, Error>()
        publisher = locationPublisher.eraseToAnyPublisher()
        
        super.init()
        manager.delegate = self
    }

    func start() {
        guard utility.authorizationStatusIsEnabled() else {
            locationPublisher.send(completion: Subscribers.Completion.failure(RuntimeError("authorizationStatus is not authorizedWhenInUse or authorizedAlways")))
            return
        }
        manager.startMonitoringVisits()
    }
    
    func stop() {
        manager.stopMonitoringVisits()
    }
    
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let location = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
        locationPublisher.send(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationPublisher.send(completion: Subscribers.Completion.failure(error))
    }
}
