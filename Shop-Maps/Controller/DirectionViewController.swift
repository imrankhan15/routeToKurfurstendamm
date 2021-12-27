//
//  DirectionViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 18/3/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var myRoute : MKRoute!
    
    var coordinate : CLLocationCoordinate2D!
    
    @IBOutlet var theMap: MKMapView!
    @IBOutlet var theLabel: UILabel!
    
    var manager: CLLocationManager!
    
    var myLocations: [CLLocation] = []
    
    var location: CLLocation!
    
    var first_time = true; // public
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        manager = CLLocationManager()
        
        manager.delegate = self
        
        // Request location authorization
       
        
        // Set an accuracy level. The higher, the better for energy.
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        
        manager.distanceFilter = 10;
        
       
        
        theMap.delegate = self
        theMap.mapType = MKMapType.standard
        
        theMap.showsUserLocation = true

    
        let spanX = 0.007
        let spanY = 0.007
        
        let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        
        theMap.setRegion(newRegion, animated: true)
        
        
        manager.requestWhenInUseAuthorization()
        
        manager.requestLocation()
      
    }
    
   /* @objc func update() {
        manager.startUpdatingLocation()

    }*/
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let location = locations.first {
            print("Found user's location: \(location)")
            
            self.location = location
            printRoute()
        }
        
        
        
      
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
       manager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let myLineRenderer = MKPolylineRenderer(polyline: myRoute.polyline)
        myLineRenderer.strokeColor = UIColor.red
        myLineRenderer.lineWidth = 3
        return myLineRenderer
    }
    
    
    func printRoute() {
        
        
        let point1 = MKPointAnnotation()
        let point2 = MKPointAnnotation()
        
        point1.coordinate = self.location.coordinate
        point1.title = "You"
        point1.subtitle = "Your location"
        self.theMap.addAnnotation(point1)
        
        point2.coordinate = CLLocationCoordinate2D(latitude: 52.5091577, longitude: 13.3315787)
        point2.title = "Kurfurstendamm"
        point2.subtitle = "Berlin"
        self.theMap.addAnnotation(point2)
        self.theMap.centerCoordinate = point2.coordinate
        self.theMap.delegate = self
        
        let coordinate₀ = self.location
        let coordinate₁ = CLLocation(latitude: 52.5091577, longitude: 13.3315787)
        
        let distanceInMeters = Int((coordinate₀?.distance(from: coordinate₁))!)
        
        theLabel.text = "You are now " + (distanceInMeters.description) + " meter away from Kurfurstendamm, Germany"

        
        //Span of the map
        self.theMap.setRegion(MKCoordinateRegionMake(point2.coordinate, MKCoordinateSpanMake(0.7,0.7)), animated: true)
        
        self.theMap.showAnnotations(self.theMap.annotations, animated: true)
        
        let directionsRequest = MKDirections.Request()
        let markTaipei = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point1.coordinate.latitude, point1.coordinate.longitude), addressDictionary: nil)
        let markChungli = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point2.coordinate.latitude, point2.coordinate.longitude), addressDictionary: nil)
        
        directionsRequest.source = MKMapItem(placemark: markChungli)
        directionsRequest.destination = MKMapItem(placemark: markTaipei)
        
        directionsRequest.transportType = MKDirectionsTransportType.automobile
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate(completionHandler: {
            response, error in
            
            if error == nil {
                self.myRoute = response!.routes[0] as MKRoute
                self.theMap.addOverlay(self.myRoute.polyline)
            }
            else {
     //           print(error ?? nil)
            }
            
        })

        
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
