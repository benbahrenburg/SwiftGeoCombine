//
//  GeoReverseLookup.swift
//  SwiftGeoCombine
//
//  Created by Ben Bahrenburg on 10/13/2019.
//  Copyright © 2019 bencoding.com. All rights reserved.
//

import Combine
import Foundation
import CoreLocation

final class GeoReverseLookup: NSObject, CLLocationManagerDelegate {
    private let placemarkPublisher: PassthroughSubject<[CLPlacemark]?, Error>
    private var publisher: AnyPublisher<[CLPlacemark]?, Error>

    override init() {
        placemarkPublisher = PassthroughSubject<[CLPlacemark]?, Error>()
        publisher = placemarkPublisher.eraseToAnyPublisher()
        
        super.init()
    }
    
    func find(latitude: Double, longitude: Double, locale: Locale = Locale.current) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), preferredLocale: locale) {[weak self] (placemark, error) in
            if let error = error {
                self?.placemarkPublisher.send(completion: Subscribers.Completion.failure(error))
                return
            }
            self?.placemarkPublisher.send(placemark)
        }
    }
}
