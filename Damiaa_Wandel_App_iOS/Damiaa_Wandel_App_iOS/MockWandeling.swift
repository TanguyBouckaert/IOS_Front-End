//
//  Wandeling.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 13/12/2020.
//

import Foundation

//public class MockWandeling: Decodable {
//    
//    var id: String!
//    var title: String
//    var afstand: String
//    var omschrijving: String
//    
//    enum CodingKeys : String, CodingKey{
//        case id
//        case title = "Title"
//        case afstand = "50.0"
//        case omschrijving = "Omschrijving"
//    }
//    
//    init(Title:String, Afstand:String, Omschrijving:String) {
//        self.id = String(Int.random(in: 1..<20))
//        self.title = Title
//        self.afstand = Afstand
//        self.omschrijving = Omschrijving
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
//        
////        self.id = try valueContainer.decode(String.self, forKey: CodingKeys.id)
//        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
//        self.afstand = try valueContainer.decode(String.self, forKey: CodingKeys.afstand)
//        self.omschrijving = try valueContainer.decode(String.self, forKey: CodingKeys.omschrijving)
//    }
//}
