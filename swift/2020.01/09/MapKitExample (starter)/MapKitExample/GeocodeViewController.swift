//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit


final class GeocodeViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: gesture.view)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        reverseGeocode(location: location)
    }
    
    func reverseGeocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            guard let address = placeMark?.first,
                let country = address.country,
                let administrativeArea = address.administrativeArea,
                let locality = address.locality,
                let name = address.name
            else { return }
            
            let addr = "\(country) \(administrativeArea) \(locality) \(name)"
            print(addr)
            
            self.geocodeAddressString(addr)
        }
    }
    
    func geocodeAddressString(_ addressString: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            guard let place = placeMark?.first else { return }
            print(place)
        }
    }
}
