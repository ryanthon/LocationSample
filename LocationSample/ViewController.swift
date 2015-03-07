//
//  ViewController.swift
//  LocationSample
//
//  Created by Ryan Khalili on 3/6/15.
//  Copyright (c) 2015 CSR. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        createRegions()
        
//        let uuidString = "E15382BA-CF0B-4392-9007-36973CA99FF8"
//        let uuid = NSUUID( UUIDString: uuidString )
//        let beaconRegion = CLBeaconRegion( proximityUUID: uuid, identifier: "CSR beacon" )
//        beaconRegion.notifyEntryStateOnDisplay = true
//        
//        if CLLocationManager.isMonitoringAvailableForClass( CLBeaconRegion.classForCoder() ) {
//            locationManager.startRangingBeaconsInRegion( beaconRegion )
//            locationManager.startMonitoringForRegion( beaconRegion )
//            locationManager.requestStateForRegion( beaconRegion )
//        }
    }
    
    func createRegions() {
        
        let lat = 37.3983930
        let lon = -121.9115680
        let coordinate = CLLocationCoordinate2DMake( lat, lon )
        let radius = 300.0
        let identifier = "CSR San Jose"
        let region = CLCircularRegion(center: coordinate, radius: radius, identifier: identifier)
        locationManager.startMonitoringForRegion(region)
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        for beacon in beacons {
            println( beacon.UUIDString )
        }
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        
        println( region )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!) {
        
        
        print( "monitoring failed with error: \(error)" )
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        
        print( "Entered region!" )
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        
        print( "Exited region!" )
    }

    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        println( newLocation.coordinate.latitude )
        println( newLocation.coordinate.longitude )
    }
}

