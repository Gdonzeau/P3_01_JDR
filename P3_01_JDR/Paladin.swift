//
//  Paladin.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 22/02/2021.
//

import Foundation

class Paladin:Hero {
    var classNumber = 0 // Colonne des tableaux de carac
    override var HP:Int { game.HPClass[0] }
    //HPInGame = game.HPClass[0]
    override var equipment:String { game.equipmentClass[0] }
}
