//
//  main.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 15/02/2021.
//

import Foundation

class Game {
    enum gameState {
        case over
        case going
    }
    var state:gameState = .going
    var Players = [player1,player2]
    var nameAlreadyExists = false
    
    func giveNameToPlayer() {
        for i in 0..<Players.count {
            print("Bonjour Joueur \(i+1). Comment vous appelez-vous ?")
            if let text = readLine() {
                var names = [player1.name,player2.name]
                if checkName(nameToCheck: text,names:names ) {
                    giveNameToPlayer()
                }
                
                else {
                   // let newName =
                names[i] = text
                    if i == 0 {
                        player1.name = text
                    }
                    if i == 1 {
                        player2.name = text
                    }
                    //Players[i].name = names[i]
                print("Bonjour \(names[i]).")
                }
            }
        }
    }
    
    func checkName(nameToCheck: String,names:[String]) -> Bool {
        for name in names {
            if nameToCheck == name {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
                break
            }
            else {
                nameAlreadyExists = false
            }
        }
        return nameAlreadyExists
    }
}

var game = Game()

class Player {
    var name = ""
    var groupOfHeroes = [Hero(),Hero(),Hero()]
}

var player1 = Player()
var player2 = Player()

class Hero {
    enum heroClass {
        case Barbarian, Ranger, Mage, Warrior, Druid, toDefine
    }
    var name = ""
    var HP = 100
    var type:heroClass = .toDefine
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
var premierHero = Hero()

game.giveNameToPlayer()
