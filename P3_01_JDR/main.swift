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
    
    func giveNameToHeroes(counted:Int) {
        for count in counted ..< 6 {
            if count<player1.heroes.count {
                print("\(player1.name), comment appelez-vous votre héros \(count+1)?")
            }
            else {
                print("\(player2.name), comment appelez-vous votre héros \(count-player1.heroes.count+1) ?")
            }
        if let nameHero = readLine() {
            if (checkHeroesName(nameToCheck: nameHero,count:count)) {
                giveNameToHeroes(counted: count)
            }
            else {
                if count < 3 {
                    player1.heroes[count].name = nameHero
                    print("Count = \(count)")
                    }
                else {
                    player2.heroes[count-3].name = nameHero
                    print("Count = \(count)")
                    }
                }
            }
        }
    }
    func checkHeroesName(nameToCheck: String,count:Int) -> Bool {
        let namesUsed = [player1.heroes[0].name,player1.heroes[1].name,player1.heroes[2].name,player2.heroes[0].name,player2.heroes[1].name,player2.heroes[2].name]
        for name in namesUsed {
            if nameToCheck == name {
                print("Ce nom existe déjà.")
                print("count : \(count)")
                nameAlreadyExists = true
                break
            }
            else {
                nameAlreadyExists = false
            }
        }
        return nameAlreadyExists
    }
    
    func Fight(Attacker:String,Attacked:String) {
        
    }
}

var game = Game()

class Player {
    var name = ""
    var hero1 = Hero()
    var hero2 = Hero()
    var hero3 = Hero()
    var heroes = [Hero(),Hero(),Hero()]
}

var player1 = Player()
var player2 = Player()

class Hero {
    /*
    enum Classe { // Enum avec un nom français pour ne pas mélanger avec les termes de programmation
        case Barbarian, Ranger, Mage, Warrior, Druid, toDefine
    }
 */
    var name = ""
    var HP = 100
    var equipment = ""
  //  var type:heroClass = .toDefine
}
/*
func ajustHeroClasse(HeroClass:enum) {
    switch HeroClass {
    case is Barbarian:
        <#code#>
    case Ranger:
        <#code#>
    case Mage:
        <#code#>
    case Warrior:
        <#code#>
    case Druid:
        <#code#>
    default:
        <#code#>
    }
}
*/
/*
class Barbarian:Hero {
    
}
 */
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

game.giveNameToHeroes(counted: 0)

