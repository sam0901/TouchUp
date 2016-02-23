//
//  LocationManager.swift
//  TouchUp
//
//  Created by Samba Tiyyagura on 2016-02-22.
//  Copyright © 2016 Samba Tiyyagura. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }
    
    @objc func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError: \(error.description)")
    }
    
    func getDistance(artistLocation: CLLocation?, userLocation: CLLocation?) -> Double? {
        return userLocation!.distanceFromLocation(artistLocation!)
    }
}
