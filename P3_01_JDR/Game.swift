//
//  Game.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Game {
    var gameTurn = 0 // Pour calculer le nombre de tours de jeu
    var numberOfPlayers = 2
    var numberOfHeroes = 3 // A part le tableau de combat qui n'est pas en for et qui affiche 3 héros, on peut modifier le nombre pour augmenter/diminuer le nombre de héros
    let probabilityOfChest = 90 // Pourcentage de chance d'apparition d'un coffre
    
    // MARK: Tableau des caractéristiques de classes
    var nameClass = ["Barbare","Mage"] // Nom de la classe
    var equipmentClass = ["une épée","un sort de soin"] // Équipement de base de la classe
    var HPClass = [120,80] // Points de vie de base de la classe
    
    var possibleEquipment = ["une épée","un sort de soin","un poignard","une hache","une masse d'arme"] // Tous les équipements possibles (on peut en ajouter dans le tableau)
    var woundsCausedByEquipment = [30,-40,20,40,50] // Dégats causés par l'équipement (un dégat négatif soigne)
    
    
    enum gameState {
        case over
        case going
    }
    
    var state:gameState = .going
    var Players = [player1,player2]
    var nameAlreadyExists = false
    
    // Création et initialisation de différentes variables du jeu
    var HPPlayer1 = 0 // total des points de vie de l'équipe
    var HPPlayer2 = 0
    var Attacker = Hero(classe: "", name: "", HPInGame: 10, equipmentInGame: "")
    var Attacked = Hero(classe: "", name: "", HPInGame: 10, equipmentInGame: "")
    var nbAttacker = 0
    var nbAttacked = 0
    
    // MARK: Nom des joueurs
    
    func giveNameToPlayer1() { // On demande son nom au premier joueur
        print("Bonjour Joueur 1. Comment vous appelez-vous ?")
        if let namePlayer1 = readLine() {
            Player.name = namePlayer1
            print("Bonjour \(Player.name).")
        }
    }
    func giveNameToPlayer2() { // On demande son nom au deuxième joueur
        print("Bonjour Joueur 2. Comment vous appelez-vous ?")
        if let namePlayer2 = readLine() {
            
            if checkPlayerName(nameToCheck: namePlayer2) { // On vérifie que le nom n'existe pas
                giveNameToPlayer2() // S'il existe on recommence l'opération
            }
            
            else {
                Player.name = namePlayer2
                print("Bonjour \(Player.name).")
            }
        }
    }
    // On vérifie que le nom du joueur n'est pas déjà pris
    func checkPlayerName(nameToCheck: String) -> Bool { //
        
        if nameToCheck == Player.name {
            print("Ce nom existe déjà.")
            
            nameAlreadyExists = true
        }
        else {
            nameAlreadyExists = false
        }
        return nameAlreadyExists
    }

    // MARK: Combat entre les héros
    
    func startFight() {
        
        let pièce = Int(arc4random_uniform(UInt32(2))) // On lance une pièce pour savoir qui commence
        if pièce == 0 {
            print("\(player1.name) commence.")
            player1.myGo = true
        }
        else {
            print("\(player2.name) commence.")
            player2.myGo = true
        }
        
        while HPPlayer1 > 0 && HPPlayer2 > 0 { // Tant que les deux joueurs ont encore des HP
            if player1.myGo {
                
                //while 1 == 2 { // Condition à trouver
                print("\(player1.name), qui envoyez-vous au combat ?")
                
                for i in 0..<numberOfHeroes {
                    if player1.heroes[i].HPInGame > 0 {
                        print("[\(i+1)]. \(player1.heroes[i].name) ?")
                    }
                }
                
                if let answer1 = readLine() {
                    Attacker = player1.heroes[Int(answer1)!-1]
                    nbAttacker = Int(answer1)!-1
                    magicChest(playingHero: Attacker)
                }
                //  }
                
                if Attacker.attack > 0 {
                    print("Qui souhaitez-vous attaquer ?")
                    
                    for i in 0..<numberOfHeroes {
                        if player2.heroes[i].HPInGame > 0 {
                            print("[\(i+1)]. \(player2.heroes[i].name) ? PV restants : \(player2.heroes[i].HPInGame)")
                        }
                    }
                    if let answer2 = readLine() {
                        Attacked = player2.heroes[Int(answer2)!-1]
                        nbAttacked = Int(answer2)!-1
                    }
                    Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
                }
                else {
                    print("Qui souhaitez-vous soigner ?")
                    for i in 0..<numberOfHeroes {
                        if player1.heroes[i].HPInGame > 0 {
                            print("[\(i+1)]. \(player1.heroes[i].name) ? PV restants : \(player1.heroes[i].HPInGame)")
                        }
                    }
                    
                    if let answer2 = readLine() {
                        Attacked = player2.heroes[Int(answer2)!-1]
                        nbAttacked = Int(answer2)!-1
                    }
                    Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
                }
            }
            if player2.myGo {
                print("\(player2.name), qui envoyez-vous au combat ?")
                for i in 0..<numberOfHeroes {
                    if player2.heroes[i].HPInGame > 0 {
                        print("[\(i+1)]. \(player2.heroes[i].name) ?")
                    }
                }
                
                if let answer1 = readLine() {
                    Attacker = player2.heroes[Int(answer1)!-1]
                    nbAttacker = Int(answer1)!-1
                    magicChest(playingHero: Attacker)
                }
                if Attacker.attack > 0 {
                    print("Qui souhaitez-vous attaquer ?")
                    for i in 0..<numberOfHeroes {
                        if player1.heroes[i].HPInGame > 0 {
                            print("[\(i+1)]. \(player1.heroes[i].name) ? PV restants : \(player1.heroes[i].HPInGame)")
                        }
                    }
                    
                    if let answer2 = readLine() {
                        Attacked = player1.heroes[Int(answer2)!-1]
                        nbAttacked = Int(answer2)!-1
                    }
                    Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
                }
                else {
                    print("Qui souhaitez-vous soigner ?")
                    for i in 0..<numberOfHeroes {
                        if player2.heroes[i].HPInGame > 0 {
                            print("[\(i+1)]. \(player2.heroes[i].name) ? PV restants : \(player2.heroes[i].HPInGame)")
                        }
                    }
                    
                    if let answer2 = readLine() {
                        Attacked = player2.heroes[Int(answer2)!-1]
                        nbAttacked = Int(answer2)!-1
                    }
                    Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
                }
            }
            game.HPPlayers() // On fait le bilan des blessures
            // C'est le tour de l'autre joueur
            gameTurn += 1
            player1.myGo = !player1.myGo
            player2.myGo = !player2.myGo
        } // Fin du while, un joueur a tous ses héros morts
        print("Combat terminé.")
        Bilan()
    }
    
    func magicChest(playingHero:Hero) {
        var joker = Int()
        if Int(arc4random_uniform(UInt32(100)))+1 <= probabilityOfChest { // On lance un D100 pour savoir si un coffre apparaît
            print("Un coffre apparaît devant \(playingHero.name)")
            joker = Int(arc4random_uniform(UInt32(game.possibleEquipment.count)))
            print("Le coffre contient \(game.possibleEquipment[joker])")
            print("Souhaitez-vous échanger \(playingHero.equipmentInGame) contre \(game.possibleEquipment[joker])")
            print("1. Oui")
            print("2. Non")
            
            if let choice = readLine() {
                if Int(choice) == 1 {
                    playingHero.equipmentInGame = game.possibleEquipment[joker]
                }
                else {
                    // On pourrait aussi répéter en cas de réponse ni 1 ni 2. Mais si le joueur n'arrive pas à appuyer sur la bonne touche, c'est peut-être imprudent de lui laisser une arme. ;)
                    print("On ne change pas")
                }
            }
        }
    }
    
    
    func Fight(Attacker:Hero,nbAttacker:Int,Attacked:Hero,nbAttacked:Int) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        if Attacker.attack > 0 { // Si on attaque                           // En fait en possédant le numéro, Attacker et Attacked ne sont plus utiles
            print("\(Attacker.name) tape sur \(Attacked.name)")
            if (player1.myGo) { // Si c'est le tour du joueur 1
                player2.heroes[nbAttacked].HPInGame -= player1.heroes[nbAttacker].attack
                if player2.heroes[nbAttacked].HPInGame < 0 {
                    player2.heroes[nbAttacked].HPInGame = 0
                }
                print("\(player2.heroes[nbAttacked].name) perd \(player1.heroes[nbAttacker].attack)PV. Il lui reste \(player2.heroes[nbAttacked].HPInGame)PV")
                if player2.heroes[nbAttacked].HPInGame<1 {
                    print("\(player2.heroes[nbAttacked].name) est mort.")
                }
            }
            else { // Si c'est le tour du joueur 2
                player1.heroes[nbAttacked].HPInGame -= player2.heroes[nbAttacker].attack
                if player1.heroes[nbAttacked].HPInGame < 0 {
                    player1.heroes[nbAttacked].HPInGame = 0
                }
                print("\(player1.heroes[nbAttacked].name) perd \(player2.heroes[nbAttacker].attack)PV. Il lui reste \(player1.heroes[nbAttacked].HPInGame)PV")
                if player1.heroes[nbAttacked].HPInGame<1 {
                    print("\(player1.heroes[nbAttacked].name) est mort.")
                }
            }
        }
        else { // Ou si on soigne
            print("\(Attacker.name) soigne \(Attacked.name)")
            if (player1.myGo) { // Si c'est le tour du joueur 1
                player1.heroes[nbAttacked].HPInGame -= player1.heroes[nbAttacker].attack
                if player1.heroes[nbAttacked].HPInGame > player1.heroes[nbAttacked].HP { // Si les soins font dépasser les HP de base
                    player1.heroes[nbAttacked].HPInGame = player1.heroes[nbAttacked].HP // On ne dépasse pas les HP de base
                }
                print("\(player1.heroes[nbAttacked].name) gagne \(-player1.heroes[nbAttacker].attack)PV. Il a maintenant \(player1.heroes[nbAttacked].HPInGame)PV")
            }
            else { // Si c'est le tour du joueur 2
                player2.heroes[nbAttacked].HPInGame -= player2.heroes[nbAttacker].attack
                if player2.heroes[nbAttacked].HPInGame > player2.heroes[nbAttacked].HP { // Si les soins font dépasser les HP de base
                    player2.heroes[nbAttacked].HPInGame = player2.heroes[nbAttacked].HP // On ne dépasse pas les HP de base
                }
                print("\(player2.heroes[nbAttacked].name) gagne \(-player2.heroes[nbAttacker].attack)PV. Il a maintenant \(player2.heroes[nbAttacked].HPInGame)PV")
            }
        }
    }
    
    func Bilan() { //On fait le total des tours et de ce qui est important à relater
        print("Résultat de la bataille")
        if HPPlayer1 < 1 {
            print("\(player2.name) gagne.")
        }
        else {
            print("\(player1.name) gagne.")
        }
        player1.state()
        player2.state()
        
        
    }
    
}
