//
//  ViewController.swift
//  Task
//
//  Created by Soohan Lee on 2020/01/09.
//  Copyright © 2020 Soohan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private lazy var searchBar = UISearchBar(frame: .zero)
    
    private let houseAddress = "1 Sejongno, Jongno-gu, Seoul, South Korea"
    
    private var travelCount = 0
    
    private var previousCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        mapView.delegate = self
        
        getCoordinateFrom(address: houseAddress) { (location) in
            self.setRegion(coordinate: location)
            self.addHouseAnnotation(location)
            self.drawTriangleAround(location)
        }
    }
    
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    private func clLocationCoordinate2DToClLocation(locationCoordinate2D: CLLocationCoordinate2D) -> CLLocation {
        let getLat: CLLocationDegrees = locationCoordinate2D.latitude
        let getLon: CLLocationDegrees = locationCoordinate2D.longitude
        
        let location: CLLocation =  CLLocation(latitude: getLat, longitude: getLon)
        
        return location
    }
    
    private func addHouseAnnotation(_ coordinate: CLLocationCoordinate2D) {
        let houseAnnotation = MKPointAnnotation()
        houseAnnotation.title = "집"
        houseAnnotation.coordinate = coordinate
        
        mapView.addAnnotation(houseAnnotation)
    }
    
    private func addCustomAnnotation(_ coordinate: CLLocationCoordinate2D, _ title: String) {
        let location = clLocationCoordinate2DToClLocation(locationCoordinate2D: coordinate)
        let customAnnotation = MKPointAnnotation()
        
        customAnnotation.coordinate = coordinate
        customAnnotation.title = title
        
        getAddressFrom(coordinate: location, complation: { (address) in
            customAnnotation.subtitle = address
        })
        
        mapView.addAnnotation(customAnnotation)
    }
    
    private func drawTriangleAround(_ coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        
        var point1 = center; point1.latitude += 0.001
        var point2 = center; point2.longitude += 0.001; point2.latitude -= 0.001
        var point3 = center; point3.longitude -= 0.001; point3.latitude -= 0.001
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline)
    }
    
    private func drawSquareAround(_ coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        
        var point1 = center; point1.longitude += 0.003; point1.latitude -= 0.003
        var point2 = center; point2.longitude += 0.003; point2.latitude += 0.003
        var point3 = center; point3.longitude -= 0.003; point3.latitude += 0.003
        var point4 = center; point4.longitude -= 0.003; point4.latitude -= 0.003
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline)
    }
    
    private func drawLineBetween(_ currentCoordinate: CLLocationCoordinate2D, _ previousCoordinate: CLLocationCoordinate2D) {
        let points: [CLLocationCoordinate2D] = [currentCoordinate, previousCoordinate]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline)
    }
    
    private func getCoordinateFrom(address: String, complation: @escaping (CLLocationCoordinate2D) -> ()) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else { return }
            
            complation(location.coordinate)
        }
    }
    
    private func getAddressFrom(coordinate: CLLocation, complation: @escaping (String) -> ()) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(coordinate) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            guard
                let address = placeMark?.first,
                let country = address.country,
                let administrativeArea = address.administrativeArea,
                let locality = address.locality,
                let name = address.name
            else { return }
            
            let addr = "\(country) \(administrativeArea) \(locality) \(name)"
            
            complation(addr)
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let address = searchBar.text else { return }
        
        getCoordinateFrom(address: address) { (location) in
            
            if self.previousCoordinate?.latitude != location.latitude &&
                self.previousCoordinate?.longitude != location.longitude {
                
                self.travelCount += 1
                
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: location, span: span)
                
                self.drawSquareAround(location)
                
                self.addCustomAnnotation(location, "\(self.travelCount)번째 행선지")
                
                if let previousLocation = self.previousCoordinate {
                    self.drawLineBetween(location, previousLocation)
                }
                
                self.mapView.setRegion(region, animated: true)
                
                self.previousCoordinate = location
            }
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let  polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 2
            
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
