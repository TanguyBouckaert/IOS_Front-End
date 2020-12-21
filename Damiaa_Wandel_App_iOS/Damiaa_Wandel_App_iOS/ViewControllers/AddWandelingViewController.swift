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
    
    var homeScreen: HomeScreenViewController! //Is niet volledig juist
    var tableView : UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Wandeling]?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //Do any additional setup after loading the view
        tableView = homeScreen.gettableview() // Normaal gezien moet hij de juiste tableview hebben
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func addWandeling(_ sender: Any) {
        
        //Get the textfield
        let title = input_title.text
        let afstand = input_afstand.text
        let omschrijving = input_omschrijving.text
        
        //Create a Wandeling object
        
        
        //Save the data
        
        //Re-fetch the data
    }
    
}

extension AddWandelingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WandelingCell", for: indexPath)
        
        let wandeling = self.items![indexPath.row]
        
        cell.textLabel?.text = wandeling.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
