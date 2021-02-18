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
        /*
        let classHeroes = [player1.heroes[0].classe,player1.heroes[1].classe,player1.heroes[2].classe,
                           player2.heroes[0].classe,player2.heroes[1].classe,player2.heroes[2].classe]
        */
        
        for i in 0 ..< 6 {
            if (i < 3 && player1.heroes[i].classe == "") || (i > 2 && player2.heroes[i-player1.heroes.count].classe == ""){ // On cherche la première case vide dans le tableau des classes (au début chez le joueur 1, puis chez le joueur 2
            if i<3 {
                print("\(player1.name), quelle carrière affectez-vous à \(namesUsed[i]) ?"
                + "\n 1.Barbare"
                + "\n 2.Mage")
                if let text = readLine() {
                    switch Int(text) {
                    case 1 :
                    player1.heroes[i].classe = "Barbare"
                    case 2 :
                    player1.heroes[i].classe = "Mage"
                    default :
                        print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                        classAssignation()
                    }
                }
            }
            else {
                print("\(player2.name), quelle carrière affectez-vous à \(namesUsed[i]) ?"
                    + "\n 1.Barbare"
                    + "\n 2.Mage")
                if let text = readLine() {
                    switch Int(text) {
                    case 1 :
                    player2.heroes[i-3].classe = "Barbare"
                    case 2 :
                    player2.heroes[i-3].classe = "Mage"
                    default :
                        print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                        classAssignation()
                    }
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
    var classe = ""
    var equipmentBase:String {
        get {
            switch classe {
            case "Barbare":
                return "une épée"
            case "Mage":
                return "un sort de soin"
            default :
                return "un petit bâton"
            }
        }
    }
    // Idée pour plus tard : introduire plusieurs tableaux pour le switch pour pouvoir changer facilement les caractéristiques et rajouter des types de héros.
    // Chaque tableau aurait au même "i" les caractéristiques de la même classe. Ex: tableau 1 : Barbare, tableau 2 : une épée, tableau 3 : 120 PV, etc.
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
            case "une épée":
                return 30
            case "un poignard":
                return 20
            case "un sort de soin":
                return -40
            case "une hache":
                return 40
            case "une masse d'arme":
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


game.giveNameToPlayer1()
game.giveNameToPlayer2()

game.giveNameToHeroes()

print("Le joueur \(player1.name) a les héros \(player1.heroes[0].name), \(player1.heroes[1].name), \(player1.heroes[2].name)")
print("Le joueur \(player2.name) a les héros \(player2.heroes[0].name), \(player2.heroes[1].name), \(player2.heroes[2].name)")

game.classAssignation()
// Les héros préparent leur équipement
for i in 0..<3 {
player1.heroes[i].changeWeapon()
}
for i in 0..<3 {
player2.heroes[i].changeWeapon()
}
// Mettre le code en dessous dans une fonction, mais pas ce soir.
for i in 0..<3 {
print("\(player1.heroes[i].name) est un \(player1.heroes[i].classe)")
print("Il possède \(player1.heroes[i].equipmentBase),")
if player1.heroes[i].attack > 0 {
    print("une attaque de \(player1.heroes[i].attack)")
    }
    else {
        print("soigne \(-player1.heroes[i].attack) PV, ")
        
    }
    print("et a \(player1.heroes[i].HP) PV \n")
}

for i in 0..<3 {
    print("\(player2.heroes[i].name) est un \(player2.heroes[i].classe)")
    print("Il possède \(player2.heroes[i].equipmentBase),")
    if player2.heroes[i].attack > 0 {
        print("une attaque de \(player2.heroes[i].attack)")
        }
        else {
            print("soigne \(-player2.heroes[i].attack) PV, ")
            
        }
        print("et a \(player2.heroes[i].HP) PV \n")
    }
