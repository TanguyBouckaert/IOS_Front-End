//
//  AddWandelingViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 16/12/2020.
//

import UIKit
import CoreData


class AddWandelingViewController: UIViewController {
    
    @IBOutlet var input_title : UITextField!
    @IBOutlet var input_afstand : UITextField!
    @IBOutlet var input_omschrijving: UITextField!
    
    var alert : UIAlertController!
    var homeScreen: HomeScreenViewController! //Maakt een object van de homescreencontroller
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //Do any additional setup after loading the view
        homeScreen = HomeScreenViewController()
        
    }
    
    @IBAction func addWandeling(_ sender: Any) {
        
        //Toont eerst een alert voor een wandeling wordt toegevoegd
        self.alert = UIAlertController(title: self.input_title.text, message: self.input_omschrijving.text, preferredStyle: .alert)
        let okeAction = UIAlertAction(title: "OK", style: .default){
            UIAlertAction in
            
            //Get the textfield
            let title = self.input_title.text
            let afstand = self.input_afstand.text
            let omschrijving = self.input_omschrijving.text
            
            //Create a Wandeling object
            let newWandeling = Wandeling(context: self.context)
            newWandeling.title = title
            newWandeling.afstand = afstand
            newWandeling.omschrijving = omschrijving
            
            //Save the data
            do {
                try self.context.save()
            } catch {
                print("An error occurred while saving the newWandeling!!!")
            }
            
        }
        self.alert.addAction(okeAction)// Moet naar een detail pagina gaan!!
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
            print("doe niets")
        }
        self.alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}


