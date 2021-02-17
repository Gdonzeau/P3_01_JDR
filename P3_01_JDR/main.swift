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
    
    func giveNameToHeroes() { // On ne remplit les cases du tableau des noms que si le nom proposé n'existe pas déjà.
        for count in 0 ..< 6 {
            if (count < 3 && player1.heroes[count].name == "") || (count > 2 && player2.heroes[count-player1.heroes.count].name == ""){ // On cherche la première case vide dans le tableau des noms (au début chez le joueur 1, puis chez le joueur 2
            if count<player1.heroes.count {
                print("\(player1.name), comment appelez-vous votre héros \(count+1)?")
            }
            else {
                print("\(player2.name), comment appelez-vous votre héros \(count-player1.heroes.count+1) ?")
            }
        if let nameHero = readLine() {
            if (checkHeroesName(nameToCheck: nameHero,count:count)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                giveNameToHeroes()
                break
            }
            else {
                if count < 3 {
                    player1.heroes[count].name = nameHero
                    }
                else {
                    player2.heroes[count-3].name = nameHero
                    }
                }
            }
        }
    }
    }
    func checkHeroesName(nameToCheck: String,count:Int) -> Bool {
        let namesUsed = [player1.heroes[0].name,player1.heroes[1].name,player1.heroes[2].name,
                         player2.heroes[0].name,player2.heroes[1].name,player2.heroes[2].name]
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
    
    func Fight(Attacker:String,Attacked:String) {
        
    }
}

var game = Game()

class Player {
    var name = ""
    //var hero1 = Hero()
    //var hero2 = Hero()
    //var hero3 = Hero()
    var heroes = [Hero(),Hero(),Hero()]
    //var heroes = [hero1,hero2,hero3]
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

game.giveNameToHeroes()

print("Le joueur \(player1.name) a les héros \(player1.heroes[0].name), \(player1.heroes[1].name), \(player1.heroes[2].name)")
print("Le joueur \(player2.name) a les héros \(player2.heroes[0].name), \(player2.heroes[1].name), \(player2.heroes[2].name)")
