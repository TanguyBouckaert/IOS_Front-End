//
//  HomeScreenViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit
import SwiftUI

class HomeScreenViewController: UITableViewController {
    
    
//    var wandellijstItems : Result<Wandeling>!
    var wandellijstItems : [Wandeling]!
//    var legelijst : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 135
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wandellijstItems = initOverzicht()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if wandellijstItems.count == 0 {
            self.showToast(message: "De lijst is leeg!")
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
    
    
    public func initOverzicht() -> [Wandeling]{
        
        var lijst : [Wandeling] = []
        
        let wandeling1 : Wandeling = Wandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
        
        let wandeling2 : Wandeling = Wandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
        
        let wandeling3 : Wandeling = Wandeling(Title: "OchtendWandeling", Afstand: "10", Omschrijving: "Een wandeling om de benen te strekken.")
        
        lijst.append(wandeling1)
        lijst.append(wandeling2)
        lijst.append(wandeling3)
        
        return lijst
    }
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
