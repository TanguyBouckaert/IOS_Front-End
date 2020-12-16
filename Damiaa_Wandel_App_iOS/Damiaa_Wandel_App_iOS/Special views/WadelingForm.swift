//
//  WadelingForm.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 16/12/2020.
//

import UIKit

class WandelingForm: UIViewController {
    
    @IBOutlet var input_title : UITextField!
    @IBOutlet var input_afstand : UITextField!
    @IBOutlet var input_omschrijving: UITextField!
    var alert : UIAlertController!
    
    
    @IBAction func maakWandeling(_ sender: UIButton) {
        
        var newWandeling = Wandeling(Title: input_title.text!, Afstand: input_afstand.text!, Omschrijving: input_omschrijving.text!)
        
        
        self.alert = UIAlertController(title: "Wandeling", message: newWandeling.omschrijving, preferredStyle: .alert)
        self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
