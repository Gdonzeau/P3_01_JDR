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
    var numberOfClasses = 2 // Nombre de classes de personnages. Facilite la navigation dans le tableau suivant
    var heroesAvailable:Any = ["Barbare","Mage",
                                120,80,
                                "Épée","Sort de soin",
                                30,-40]
    
    // MARK: Nom des joueurs
    
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
    
    // MARK: Nom des héros
    
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
    
    // MARK: Assignation des classes aux héros
    
    func classAssignation() {
        // On fait défiler les noms des héros (namesUsed), on propose au joueur de choisir la classe et on modifie le profil du héros
        let namesUsed = [player1.heroes[0].name,player1.heroes[1].name,player1.heroes[2].name,
                         player2.heroes[0].name,player2.heroes[1].name,player2.heroes[2].name]
        let classHeroes = [player1.heroes[0].classe,player1.heroes[1].classe,player1.heroes[2].classe,
                           player2.heroes[0].classe,player2.heroes[1].classe,player2.heroes[2].classe]
        
        
        for i in 0 ..< 6 {
            if i<3 {
                print("\(player1.name), quelle carrière affectez-vous à \(namesUsed[i]) ?")
                if let text = readLine() {
                    switch Int(text) {
                    case 1 :
                    player1.heroes[i].classe = "Barbare"
                    case 2 :
                    player1.heroes[i].classe = "Mage"
                    default :
                        print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                    }
                }
            }
            else {
                print("\(player2.name), quelle carrière affectez-vous à \(namesUsed[i + 3]) ?")
                if let text = readLine() {
                    switch Int(text) {
                    case 1 :
                    player2.heroes[i].classe = "Barbare"
                    case 2 :
                    player2.heroes[i].classe = "Mage"
                    default :
                        print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                    }
                }
            }
        }
    }
    
    // MARK: Combat entre les héros
    
    func Fight(Attacker:String,Attacked:String) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        
    }
}

var game = Game()

class Player {
    var name = ""
    var heroes = [Hero(),Hero(),Hero()]
}

var player1 = Player()
var player2 = Player()

class Hero {
    
    var name = ""
    var HP = 100
    var equipment = ""
    var classe = ""
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
/*
game.giveNameToPlayer1()
game.giveNameToPlayer2()

game.giveNameToHeroes()

print("Le joueur \(player1.name) a les héros \(player1.heroes[0].name), \(player1.heroes[1].name), \(player1.heroes[2].name)")
print("Le joueur \(player2.name) a les héros \(player2.heroes[0].name), \(player2.heroes[1].name), \(player2.heroes[2].name)")
*/
class Hero2 {
    var name = ""
    var classe = ""
    var equipmentBase:String {
        get {
            switch classe {
            case "Barbare":
                return "Épée"
            case "Mage":
                return "Sort de soin"
            default :
                return "Petit bâton"
            }
        }
    }
    // Idée pour plus tard : introduire plusieurs tableaux pour le switch pour pouvoir changer facilement les caractéristiques et rajouter des types de héros.
    var equipmentInGame = String()
    
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
    var attack:Int {
        get {
            switch equipmentInGame {
            case "Épée":
                return 30
            case "Poignard":
                return 20
            case "Sort de soin":
                return -40
            case "Hache":
                return 40
            case "Masse d'arme":
                return 50
            default :
                return 10
            }
        }
    }
    func changeWeapon() {
        equipmentInGame = equipmentBase
    }
}
var c = Hero2()
c.changeWeapon()
print(c.HP)
print(c.equipmentBase)
print(c.equipmentInGame)
print(c.attack)

c.classe = "Mage"
c.changeWeapon()
print(c.HP)
print(c.equipmentBase)
print(c.equipmentInGame)
print(c.attack)

c.classe = "Barbare"
c.changeWeapon()
print(c.HP)
print(c.equipmentBase)
print(c.equipmentInGame)
print(c.attack)

c.equipmentInGame = "Poignard"
print(c.HP)
print(c.equipmentBase)
print(c.equipmentInGame)
print(c.attack)
