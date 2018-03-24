//
//  ViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 2/25/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, GMSPanoramaViewDelegate {

    @IBOutlet var panoView: GMSPanoramaView!
    
    
    var mapView: GMSMapView?
    
       override func viewDidLoad() {
        super.viewDidLoad()
       
       panoView.delegate = self
        
        panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: 52.5091577, longitude: 13.3315787), radius: 100)

        
        
    }
    
    func panoramaView(_ view: GMSPanoramaView, error: Error, onMoveNearCoordinate coordinate: CLLocationCoordinate2D) {
        print(error.localizedDescription)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.panoView.animate(to: GMSPanoramaCamera(heading: 90, pitch: 0, zoom: 1), animationDuration: 2)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
  
}




