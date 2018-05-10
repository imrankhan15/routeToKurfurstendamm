//
//  recordAnswerViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 8/5/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class recordAnswerViewController: UIViewController {

    @IBOutlet weak var lbl_answer: UILabel!
    
    var answer : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_answer.text = answer
        
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
