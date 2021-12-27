//
//  ViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 2/25/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit
import GoogleMaps


class HomeViewController: UIViewController, GMSPanoramaViewDelegate {

    var mapView: GMSMapView?
    
       override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var back: UIButton!
    
    @IBAction func backHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
  
}




