//
//  main.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 15/02/2021.
//

import Foundation

class Game {
    var state = gameState.going
    
    enum gameState {
        case over
        case going
    }
}
var game = Game()

class Player {
    var name = ""
    var groupOfHeroes = [Hero(),Hero(),Hero()]
}

var player1 = Player()

class Hero:Player {
    
}

class Stuff {
    enum function {
        case heal
        case hurt
    }
    
}

class Weapon:Stuff {
    
}

class Heal:Stuff {
    
}


