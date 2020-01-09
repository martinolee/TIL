//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        checkAuthorizationStatus()
        startUpdatingLocation()
        mapView.showsUserLocation = true
//        mapView.mapType = .satellite
    }
    
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied: break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        @unknown default:
            fatalError()
        }
    }
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        
        guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
        
        guard CLLocationManager.locationServicesEnabled() else { return }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0
        
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func mornitoringHeading(_ sender: Any) {
        guard CLLocationManager.headingAvailable() else { return }
        
        locationManager.startUpdatingHeading()
        
    }
    
    @IBAction func stopMornitoring(_ sender: Any) {
        locationManager.stopUpdatingHeading()
    }
}

extension MyLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unauthorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last!
        
        let coordinate = currentLocation.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        addAnnotation(location: currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading:", newHeading.trueHeading)
        print("magneticHeading:", newHeading.magneticHeading)
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
    }
    
    func addAnnotation(location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.title = "MyLocation"
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
    }
}
