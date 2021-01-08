//
//  HomeScreenViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit
import SwiftUI


class HomeScreenViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items : [Wandeling]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        fetchWandelingen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchWandelingen()
    }
    
    func fetchWandelingen(){
        
        do{
            self.items = try context.fetch(Wandeling.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            print("Something went wrong will fetching wandelingen!!!!")
        }
    }
    
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("you tapped me!" + self.items![indexPath.row].title!)
        
        performSegue(withIdentifier: "ToDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let details = segue.destination as! DetailWandelingViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            details.wDetails = items![indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items?.count)
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WandelingCell", for: indexPath) as! WandelingCell
        
        let wandeling = self.items![indexPath.row]
        
        cell.update(wandeling: wandeling)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Verwijder") { (action, view, completionHandler) in
            
            //TODO: Which wandeling to remove
            let wandelingToRemove = self.items![indexPath.row]
            
            //TODO: Remove the wandeling
            self.context.delete(wandelingToRemove)
            
            //TODO: Save the data
            do{
                try self.context.save()
            }catch{
                print("Error while deleting a wandeling!")
            }
            
            //TODO: Refetch the data
            self.fetchWandelingen()
            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}


