//
//  WebViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 2/4/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webVIew: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        let url = URL(string: "https://www.visitberlin.de/en/kurfurstendamm")
        webVIew.loadRequest(URLRequest(url: url!))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
