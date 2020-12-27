//
//  DetailViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 26/12/2020.
//

import UIKit

class DetailWandelingViewController: UIViewController {
    
    @IBOutlet var _titel : UILabel! = UILabel()
    @IBOutlet var _afstand : UILabel! = UILabel()
    @IBOutlet var _omschrijving : UILabel! = UILabel()
    
    var wDetails : Wandeling?
    
    override func viewWillAppear(_ animated: Bool) {
        
        _titel.text = wDetails!.title
        _afstand.text = wDetails!.afstand! + " km"
        _omschrijving.text = wDetails!.omschrijving
        print("viewWillAppear")
    }
    
}
