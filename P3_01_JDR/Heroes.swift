//
//  Heroes.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Hero {
    var name: String
    var nameClass = ["Barbare","Mage"]
    var EquipmentClass = ["une épée","un sort de soin"]
    var HPClass = [120,80]
    //var classe = ""
    
    var classe:String
    
    init (classe:String,name:String) {
        self.classe = classe
        self.name = name
    }
    /*
    var equipmentBase:String {
        get {
            switch classe {
            case "Barbare":
                return "une épée"
            case "Mage":
                return "un sort de soin"
            default :
                return "un petit bâton"
            }
        }
    }
 */
    // Idée pour plus tard : introduire plusieurs tableaux pour le switch pour pouvoir changer facilement les caractéristiques et rajouter des types de héros.
    // Chaque tableau aurait au même "i" les caractéristiques de la même classe. Ex: tableau 1 : Barbare, tableau 2 : une épée, tableau 3 : 120 PV, etc.
    
    var equipmentInGame = String()
    /*
    var HP:Int {
        get {
            switch classe {
            case "Barbare":
                return 120
            case "Mage":
                return 80
            default :
                return 100
            }
        }
    }
    */
    var attack:Int {
        get {
            switch equipmentInGame {
            case "une épée":
                return 30
            case "un poignard":
                return 20
            case "un sort de soin":
                return -40
            case "une hache":
                return 40
            case "une masse d'arme":
                return 50
            default :
                return 10
            }
        }
    }
    /*
    func changeWeapon() {
        equipmentInGame = equipmentBase
    }
 */
}

class Barbare:Hero {
    var classNumber = 0 // Colonne des tableaux de carac
    var HP = game.HPClass[0]
    var equipment = game.EquipmentClass[0]
    }
class Mage:Hero {
    var classNumber = 1
    var HP = game.HPClass[1]
    var equipment = game.EquipmentClass[1]
    }
    
    

