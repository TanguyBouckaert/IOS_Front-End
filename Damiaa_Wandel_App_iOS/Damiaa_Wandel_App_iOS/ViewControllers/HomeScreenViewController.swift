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
    
    var wandellijstItems : [Wandeling] = [Wandeling]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        wandellijstItems = initOverzicht()
//
//        tableView.reloadData()
//    }
    
    
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
    
    
    
    
    
    
    public func initOverzicht() -> [Wandeling]{

        var lijst : [Wandeling] = []

        let wandeling1 : Wandeling = Wandeling()
        wandeling1.title = "Ochtendwandeling"
        wandeling1.afstand = "50"
        wandeling1.omschrijving = "Een wandeling om de benen te strekken."

//        let wandeling2 : MockWandeling = MockWandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
//
//        let wandeling3 : MockWandeling = MockWandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")

        lijst.append(wandeling1)
//        lijst.append(wandeling2)
//        lijst.append(wandeling3)

        return lijst
    }
    
    
}

extension HomeScreenViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath){
        print("you tapped me!")
    }
    
}

extension HomeScreenViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return wandellijstItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WandelingCell", for: indexPath) as! WandelingCell
        
//        cell.title?.text = wandellijstItems[indexPath.row].title
//        cell.afstand?.text = wandellijstItems[indexPath.row].afstand
//        cell.omschrijving?.text = wandellijstItems[indexPath.row].omschrijving
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        return cell
    }
    
    
}
