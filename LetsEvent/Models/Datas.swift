//
//  Datas.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 12/09/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import Foundation


struct User{
    
    var email:String
    var password:String
    var idProfile:Int
    var events: [Int] = []
}

struct Profile{
    
    var idProfile:Int
    var nom:String
    var prenom:String
    var ddn:Date
    var adresse:Adresse
    var refUser:Int = 0
}

struct Adresse{
    
    var rue:String
    var numero:String
    var cp:Int
    var localite:String
    
}

struct Event{
    
    var idEvent:Int
    var nom:String
    var categorie:Categorie
    var description:String
    var date:Date
    var heure:String
    var adresse:Adresse
    var places:Int
    var tarifs:[Double]
    
}

enum Categorie{
    case Finance,Litterature,Cinema,Debats,Sport,Musique,Technologies,Multimedia,Cuisine
}


