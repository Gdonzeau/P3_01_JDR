//
//  Mage.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 22/02/2021.
//

import Foundation

class Mage:Hero {
    var classNumber = 0 // Colonne des tableaux de carac
    override var HP:Int { 50 }
    //HPInGame = game.HPClass[0]
    override var equipment: String { game.equipmentClass[0] }
}
