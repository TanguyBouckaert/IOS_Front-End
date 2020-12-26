//
//  DetailViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 26/12/2020.
//

import UIKit

class DetailWandelingViewController: UIViewController {
    
    @IBOutlet var _titel : UILabel!
    @IBOutlet var _afstand : UILabel!
    @IBOutlet var _omschrijving : UILabel!
    
    var wandelingDetails : Wandeling!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    func setUpDetails(wandelingDetails : Wandeling){
        _titel.text = wandelingDetails.title
        _afstand.text = wandelingDetails.afstand
        _omschrijving.text = wandelingDetails.omschrijving
    }
    
}
