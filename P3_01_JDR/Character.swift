//
//  Character.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 23/02/2021.
//

import Foundation

class Character {
    var name:String {
        get {
        return ""
        }
    }
    var damage:Int {
        get {
            return weapon.damage
        }
    }
    var weapon:Weapon {
        get {
            return Dagger()
        }
    }
}
