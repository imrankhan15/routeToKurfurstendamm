//
//  recordItemViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 25/4/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit
import os.log

class RecordItemViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    var record : Record?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var txt_english: UITextField!
    
    @IBOutlet weak var txt_german: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_english.delegate = self
        txt_german.delegate = self
        
        txt_german.autocorrectionType = .no
        
        txt_english.autocorrectionType = .no
        
        if let record = record {
            navigationItem.title = record.question
            txt_english.text = record.question
            txt_german.text = record.answer
            
        }
    }
    
    func isModal() -> Bool {
        if self.presentingViewController != nil {
            return true
        }
        
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private var wasPushed: Bool {
        guard let vc = navigationController?.viewControllers.first, vc == self else {
            return true
        }
        
        return false
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddltemMode = wasPushed
        
        
        
        
        if !isPresentingInAddltemMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ItemViewController is not inside a navigation controller.")
        }
    }

    private func updateSaveButtonState() {
        
        let text = txt_german.text ?? ""
        
        let text2 = txt_english.text ?? ""
        
       
        
        saveButton.isEnabled = !text.isEmpty && !text2.isEmpty
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let english = txt_english.text ?? ""
        
        let german = txt_german.text ?? ""
        
        
        record = Record(question: english, answer: german)
    
    }
   

}
