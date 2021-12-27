//
//  ShopsViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 27/3/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    let shop_names = ["Etienne Aigner","Bally Shoe","Gucci","Armani", "Hermes", "Hublot", "Hugo Boss", "Jil Sander"]
    
    let images = ["zegna","D&G_Golden_Sneakers","gucci","armani","hermes","hublot","hugo","jilsander"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shop_names.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ShopsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ShopsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ShopsTableViewCell.")
        }
        
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.selectionStyle = .none
        
        cell.Name.text = shop_names[indexPath.row]
        
       // cell.imgView.image = UIImage(named:images[indexPath.row])
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
    }
    
   

    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
            
            
        case "showShops":
            
            
            
            guard let shopsDetailViewController = segue.destination as? ShopsDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            
            guard let selectedItemCell = sender as? ShopsTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedRow = indexPath.row
            
            
           shopsDetailViewController.selectedRow = selectedRow
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }

       
    }
   

}
