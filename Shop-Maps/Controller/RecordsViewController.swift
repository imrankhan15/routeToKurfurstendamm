//
//  recordsViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 18/4/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

import os.log

class RecordsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     var records = [Record]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(recordsViewController.editButtonPressed))
        
        if let savedRecords = loadRecords() {
            records += savedRecords
        }
            
        else {
            
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    @objc func editButtonPressed(){
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing == true{
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(recordsViewController.editButtonPressed))
        }else{
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(recordsViewController.editButtonPressed))
        }
    }

    private func loadRecords() -> [Record]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Record.ArchiveURL.path) as? [Record]
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "RecordsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecordsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RecordTableViewCell.")
        }
        
        let record = records[indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.accessoryType = .disclosureIndicator
        
        
        
        cell.german.text = record.answer
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            records.remove(at: indexPath.row)
            saveRecord()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    private func saveRecord() {
        
       
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(records, toFile: Record.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Records successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save records...", log: OSLog.default, type: .error)
        }
    }
    
    @IBAction func unwindToRecordList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? recordItemViewController, let record = sourceViewController.record {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                records[selectedIndexPath.row] = record
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: records.count, section: 0)
                
                records.append(record)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            saveRecord()
            
            
            
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
            
        
        case "AddItem":
            
     
           
            
            os_log("Adding a new item.", log: OSLog.default, type: .debug)

            
        case "ShowDetail":
            
            
            
            guard let recordAnswerViewController = segue.destination as? recordAnswerViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            
            guard let selectedItemCell = sender as? RecordsTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedRecord = records[indexPath.row]
            
            
            recordAnswerViewController.answer = selectedRecord.question
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
