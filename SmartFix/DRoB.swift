//
//  DRoB.swift
//  SmartFix
//
//  Created by tr on 7/24/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import CoreLocation

import MapKit
class DRoB: UIViewController,CLLocationManagerDelegate {
    
     var locationManager:CLLocationManager!
     let locations  = [

        CLLocation(latitude:  39.785834, longitude: -126.406417),
        CLLocation(latitude:  38.785834, longitude: -123.406417),
        CLLocation(latitude:  40.785834, longitude: -128.406417)
     ]
    var closestLocation: CLLocation?
    var smallestDistance: CLLocationDistance?
    var userL:CLLocation!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    func locationInLocations(locations: [CLLocation], closestToLocation location: CLLocation) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        
        var closestLocation: CLLocation?
        var smallestDistance: CLLocationDistance?
        
        for locationn in locations {
            let distance = location.distance(from: locationn)
            if smallestDistance == nil || distance < smallestDistance! {
                closestLocation = locationn
                smallestDistance = distance
            }
        }
        
        print("closestLocation: \(closestLocation!), distance: \(smallestDistance!)")
        return closestLocation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
        
        
        let userL=CLLocation(latitude: 37.785834, longitude:  -122.406417)
       locationInLocations(locations: locations, closestToLocation: userL)
    }
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
          userL=userLocation
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}


