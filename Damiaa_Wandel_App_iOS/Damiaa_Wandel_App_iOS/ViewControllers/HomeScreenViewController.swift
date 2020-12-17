//
//  HomeScreenViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit
import SwiftUI


class HomeScreenViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var wandellijstItems : [Wandeling]!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wandellijstItems = [Wandeling]()
        fetch()
        print("Hallo")
        self.tableView.rowHeight = 135
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        wandellijstItems = initOverzicht()
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if wandellijstItems.count == 0 {
            print("De lijst is leeg!!!")
        }else{
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
        }
        
        return wandellijstItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "WandelingCell", for: indexPath) as! WandelingCell
        
        let lijstItem = wandellijstItems[indexPath.row]
        
        DispatchQueue.main.async {
            cell.update(wandeling: lijstItem)
        }
        
        return cell
    }
    
    func fetch() {
        do {
            
            self.wandellijstItems = try context.fetch(Wandeling.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("langs fetch gepasseerd!!!!")
        } catch {
            print("An error occured wail fetching data!")
        }
    }
    
    
    public func reloadData() {
        self.tableView.reloadData()
        print("tabel is herladen!!!!")
    }
    
    
    
//    public func initOverzicht() -> [Wandeling]{
//
//        var lijst : [Wandeling] = []
//
//        let wandeling1 : MockWandeling = MockWandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
//
//        let wandeling2 : MockWandeling = MockWandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
//
//        let wandeling3 : MockWandeling = MockWandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
//
//        lijst.append(wandeling1)
//        lijst.append(wandeling2)
//        lijst.append(wandeling3)
//
//        return lijst
//    }
    
    
}
