//
//  ShopsDetailViewController.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 27/3/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit

class ShopsDetailViewController: UIViewController {

    @IBOutlet weak var lbl_shopName: UILabel!
    
    @IBOutlet weak var txt_Details: UITextView!
    
    @IBOutlet weak var img_view: UIImageView!
    
    var selectedRow:Int = 0
    
     let shop_names = ["Etienne Aigner","Bally Shoe","Gucci","Armani", "Hermes", "Hublot", "Hugo Boss", "Jil Sander"]
    
    let shop_details = ["Étienne Aigner  was the founder of Etienne Aigner US and Etienne Aigner AG, two presently separate high fashion houses, based respectively in New York City and Munich, Germany ","Bally is a Swiss luxury fashion company founded as Bally & Co","Gucci (/ˈɡuːtʃi/, GOO-chee; Italian pronunciation: [ˈɡutt͡ʃi]) is an Italian luxury brand of fashion and leather goods, part of the Gucci Group, which is owned by the French holding company Kering.[2][3][4] Gucci was founded by Guccio Gucci in Florence in 1921","Giorgio Armani S.P.A. (pronounced [ˈdʒordʒo arˈmaːni]) is an Italian fashion house founded by Giorgio Armani which designs, manufactures, distributes and retails haute couture, ready-to-wear, leather goods, shoes, watches, jewelry, accessories, eyewear, cosmetics and home interiors.","t specializes in leather, lifestyle accessories, home furnishings, perfumery, jewellery, watches and ready-to-wear. Its logo, since the 1950s, is of a Duc carriage with horse. Nadège Vanhee-Cybulski is the current creative director.","Hublot (French pronunciation: ​[yblo]) is a Swiss luxury watchmaker founded in 1980 by Italian Carlo Crocco.[1] The company currently operates as a wholly owned subsidiary of France's LVMH. In 1980, it also marked the birth of the 'Fusion' concept a few months after being founded.","Hugo Boss AG, often styled as BOSS, is a German luxury fashion house. It was founded in 1924 by Hugo Boss and is headquartered in Metzingen, Germany. Originally focusing on uniforms, it was a supplier for Nazi Party organizations both before and during World War II. After the war and the founder's death in 1948, Hugo Boss started to turn its focus from uniforms to men's suits.","Heidemarie Jiline Sander (German pronunciation: [dʒɪl ˈzandər]; born 27 November 1943 in Wesselburen) is a minimalist German fashion designer and the founder of the Jil Sander fashion house."]
    
    let images = ["zegna","D&G_Golden_Sneakers","gucci","armani","hermes","hublot","hugo","jilsander"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    lbl_shopName.text = shop_names[selectedRow]
        txt_Details.text = shop_details[selectedRow]
        img_view.image = UIImage(named:images[selectedRow])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
