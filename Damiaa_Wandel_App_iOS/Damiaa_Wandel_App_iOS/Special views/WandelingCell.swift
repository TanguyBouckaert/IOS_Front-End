//
//  WandelingCell.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit

class WandelingCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var afstand: UILabel!
    @IBOutlet var omschrijving: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func update(wandeling : Wandeling){
        title.numberOfLines = 3
        title.text = wandeling.title
        afstand.text = wandeling.afstand
        omschrijving.text = wandeling.omschrijving
    }
}
