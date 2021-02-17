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
    
    func giveNameToPlayer1() {
            print("Bonjour Joueur 1. Comment vous appelez-vous ?")
        if let namePlayer1 = readLine() {
            player1.name = namePlayer1
            print("Bonjour \(player1.name).")
        }
    }
    func giveNameToPlayer2() {
        print("Bonjour Joueur 2. Comment vous appelez-vous ?")
            if let namePlayer2 = readLine() {
                
                if checkPlayerName(nameToCheck: namePlayer2) {
                    giveNameToPlayer2()
                }
                
                else {
                    player2.name = namePlayer2
                    print("Bonjour \(player2.name).")
                }
            }
    }
    func checkPlayerName(nameToCheck: String) -> Bool {
        
        if nameToCheck == player1.name {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
            }
            else {
                nameAlreadyExists = false
            }
        return nameAlreadyExists
    }
    
    func checkHeroName(nameToCheck: String) -> Bool {
        let namesUsed = [player1.hero1.name,player1.hero2.name,player1.hero3.name,player2.hero1.name,player2.hero2.name,player2.hero3.name]
        for name in namesUsed {
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
    var hero1 = Hero()
    var hero2 = Hero()
    var hero3 = Hero()
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

game.giveNameToPlayer1()
game.giveNameToPlayer2()
