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
    var equipmentInGame:String
    init (classe:String,name:String,HPInGame:Int,equipmentInGame:String) {
        self.classe = classe
        self.name = name
        self.HPInGame = HPInGame
        self.equipmentInGame = equipmentInGame
    }
    var HP:Int {
        return 40
    }
    
    var equipment:String {
        return "un petit bâton"
            }
    var bonusAttack:Int {
        return 0
    }

    // Idée pour plus tard : introduire plusieurs tableaux pour le switch pour pouvoir changer facilement les caractéristiques et rajouter des types de héros.
    // Chaque tableau aurait au même "i" les caractéristiques de la même classe. Ex: tableau 1 : Barbare, tableau 2 : une épée, tableau 3 : 120 PV, etc.
    
    var attack:Int {
        get {
            switch equipmentInGame {
            case game.possibleEquipment[0]:
                return game.woundsCausedByEquipment[0]
            case game.possibleEquipment[1]:
                return game.woundsCausedByEquipment[1]
            case game.possibleEquipment[2]:
                return game.woundsCausedByEquipment[2]
            case game.possibleEquipment[3]:
                return game.woundsCausedByEquipment[3]
            case game.possibleEquipment[4]:
                return game.woundsCausedByEquipment[4]
                /*
            case "un poignard":
                return 20
            case "un sort de soin":
                return -40
            case "une hache":
                return 40
            case "une masse d'arme":
                return 50
                */
            default :
                return 10
            }
        }
    }
}

class Barbare:Hero {
    var classNumber = 0 // Colonne des tableaux de carac
    override var HP:Int { game.HPClass[0] }
    //HPInGame = game.HPClass[0]
    override var equipment:String { game.equipmentClass[0] }
    }

class Mage:Hero {
    var classNumber = 1
    override var HP:Int { game.HPClass[1] }
    //HPInGame = game.HPClass[1]
    override var equipment:String { game.equipmentClass[1] }
    }
    
    

