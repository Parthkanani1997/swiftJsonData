//
//  DetailsViewController.swift
//  Jsone Get data
//
//  Created by om technology on 29/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var lblRegion: UILabel!
    @IBOutlet var lblSubregion: UILabel!
    @IBOutlet var lblAlpha3code: UILabel!
    @IBOutlet var lblAlpha2code: UILabel!
  
       //Local Variable
    var regionstr:String!
    var subregionstr:String!
    var alph3str:String!
    var alph2str:String!
    
    override func viewDidLoad() {
       
     lblRegion.text = regionstr
     lblSubregion.text = subregionstr
     lblAlpha3code.text = alph3str
     lblAlpha2code.text = alph2str
        
       
        
        
        
        super.viewDidLoad()
   
    }

    
    @IBAction func BtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
     
    

}
