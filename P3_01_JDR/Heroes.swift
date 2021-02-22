//
//  Heroes.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Hero {
    var name: String
    var classe:String
    var HPInGame:Int
    static var names = [String]()
    //{
          //  return
    //}
    
    //var weapon = Weapon()
    var weapon: Weapon
    var equipmentInGame:String
    var damage:Int
    
    init (classe:String,name:String,HPInGame:Int,equipmentInGame:String,weapon:Weapon) {
        self.classe = classe
        self.name = name
        self.HPInGame = HPInGame
        self.equipmentInGame = equipmentInGame
        self.weapon = weapon
     //   self.names.append(names)
        self.damage = weapon.damage
        //let damage = weapon.damage // Proposé lundi
        
      //  self.names.append(names)// Du coup, pas sûr
    }
    var HP:Int {
        return self.HP
    }
    
    var equipment:String {
        return "un petit bâton"
    }
    var bonusAttack:Int {
        return 0
    }
    
    var attack:Int {
        get {
            return self.damage
        }
    }
}


