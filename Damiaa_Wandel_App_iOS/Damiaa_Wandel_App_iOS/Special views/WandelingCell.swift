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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 5
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func update(wandeling : Wandeling){
        title.numberOfLines = 3
        title.text = wandeling.title
        afstand.text = wandeling.afstand!
        omschrijving.text = wandeling.omschrijving
    }
}
