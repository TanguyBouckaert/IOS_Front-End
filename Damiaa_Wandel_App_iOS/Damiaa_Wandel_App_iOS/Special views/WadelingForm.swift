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
    var lijst : [Wandeling] = [Wandeling]()
    var tableview : HomeScreenViewController = HomeScreenViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBAction func maakWandeling(_ sender: UIButton) {
        
        var x = input_title.text
        print(x)
        let newWandeling = Wandeling(context: self.context)
        newWandeling.title = input_title.text
        newWandeling.afstand = input_afstand.text
        newWandeling.omschrijving = input_omschrijving.text
        print(newWandeling)
        
        self.alert = UIAlertController(title: newWandeling.title, message: newWandeling.omschrijving, preferredStyle: .alert)
        self.alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        self.lijst.append(newWandeling)
        self.saveWandelingen()

    }
    
    func saveWandelingen() {
        do{
            try self.context.save()
            print("wandeling is opgeslaan!!!!")
            self.tableview.reloadData()
        }catch{
            print("Could not add Wandeling!")
        }
    }
}
