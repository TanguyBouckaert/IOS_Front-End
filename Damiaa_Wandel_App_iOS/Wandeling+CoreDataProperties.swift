//
//  Wandeling+CoreDataProperties.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 17/12/2020.
//
//

import Foundation
import CoreData


extension Wandeling {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wandeling> {
        return NSFetchRequest<Wandeling>(entityName: "Wandeling")
    }

    @NSManaged public var title: String?
    @NSManaged public var afstand: String?
    @NSManaged public var omschrijving: String?

}

extension Wandeling : Identifiable {

}
