//
//  Game.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Game {
    var numberOfPlayers = 2
    var numberOfHeroes = 3
    
    // MARK: Tableau des caractéristiques de classes
    var nameClass = ["Barbare","Mage"] // Nom de la classe
    var equipmentClass = ["une épée","un sort de soin"] // Équipement de base
    var HPClass = [120,80] // Points de vie
    
    var equipementPossible = ["une épée","un sort de soin","un poignard","une hache","une masse d'arme"]
    var woundsCausedByEquipment = [30,-40,20,40,50]
    
    
    enum gameState {
        case over
        case going
    }
    
    var state:gameState = .going
    var Players = [player1,player2]
    var nameAlreadyExists = false
    
    var HPPlayer1 = 0
    var HPPlayer2 = 0
    var Attacker = Hero(classe: "", name: "", HPInGame: 10)
    var Attacked = Hero(classe: "", name: "", HPInGame: 10)
    var nbAttacker = 0
    var nbAttacked = 0
    // MARK: Nom des joueurs
    
    func giveNameToPlayer1() { // On demande son nom au premier joueur
            print("Bonjour Joueur 1. Comment vous appelez-vous ?")
        if let namePlayer1 = readLine() {
            player1.name = namePlayer1
            print("Bonjour \(player1.name).")
        }
    }
    func giveNameToPlayer2() { // On demande son nom au deuxième joueur
        print("Bonjour Joueur 2. Comment vous appelez-vous ?")
            if let namePlayer2 = readLine() {
                
                if checkPlayerName(nameToCheck: namePlayer2) { // On vérifie que le nom n'existe pas
                    giveNameToPlayer2() // S'il existe on recommence l'opération
                }
                
                else {
                    player2.name = namePlayer2
                    print("Bonjour \(player2.name).")
            }
        }
    }
    // On vérifie que le nom du joueur n'est pas déjà pris
    func checkPlayerName(nameToCheck: String) -> Bool { //
        
        if nameToCheck == player1.name {
                print("Ce nom existe déjà.")
            
                nameAlreadyExists = true
            }
            else {
                nameAlreadyExists = false
            }
        return nameAlreadyExists
    }
    
    // MARK: Assignation des noms et des classes aux héros
    /*
    func creationHeroes(Startcount:Int) {
    for count in Startcount..<numberOfHeroes*numberOfPlayers {
        
        if let nameHero = askName(count: count) {
            
            if count == 0 {
                print("premier héros")
                let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                print("J'envoie \(waitingName) se faire assigner une classe")
                // Et on passe à la classe
                onAssigneUneClasse(count: count,waitingName:waitingName)
            }
            /*
            else if count <= 4 {
                print("héros \(count+1)")
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
          //  else if count == 5 {
                else {
                    print("dernier héros")
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    print("encore un essai")
                    creationHeroes(Startcount:count)
                }
                */
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                    print("Et voilà.")
                    //break
                    }
           //     }
            }
        }
    }
    */
    func creationHeroes(startCount:Int,endCount:Int) {
    for count in startCount..<endCount {
        
        if let nameHero = askName(count: count) {
            if nameHero == "" {
                creationHeroes(startCount: count,endCount: count+1)
            }
            
            else {
                let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                print("J'envoie \(waitingName) se faire assigner une classe")
                // Et on passe à la classe
                onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
        }
    }
    
    func askName(count:Int) ->String?{
        nameAlreadyExists = false
        var NamesInUse = [String]() // On crée un tableau
        for i in 0..<player1.heroes.count { // dans lequel on met tous les noms des héros dejà créés par player1
            NamesInUse.append(player1.heroes[i].name)
        }
        for i in 0..<player2.heroes.count { // et par player2
            NamesInUse.append(player2.heroes[i].name)
        }
        var retour = String() // On crée également la variable String à retourner
        //var обратно:String = "" // Super, ça marche aussi en russe
        
    if count<numberOfHeroes { // si on est dans la première moitié des héros, c'est player1 qui assigne un nom
        print("\(player1.name), comment appelez-vous votre héros \(count+1)?")
    }
    else { // Sinon, c'est player2
        print("\(player2.name), comment appelez-vous votre héros \(count-numberOfHeroes+1) ?")
    }
        if let nameHero = readLine() {
            // On vérifie ici le nom, et pas plus tard ?
            for name in NamesInUse { // On vérifie que le nom n'existe pas déjà
                if nameHero == name {
                    print("\(nameHero) est déjà pris")
                    //askName(count: count)
                    //creationHeroes(Startcount: count)
                    nameAlreadyExists = true
                    break
                }
                else {
                    print("Tout va bien")
                }
            }
            retour = nameHero
        }
        if nameAlreadyExists {
            retour = ""
        }
        
        print("\(retour) revient")
        
        return retour
    }

    func onAssigneUneClasse(count:Int,waitingName:String) {
    print("Quelle carrière affectez-vous à votre perso \(waitingName) ?"
    + "\n 1.Barbare"
    + "\n 2.Mage")
    if let text = readLine() {
        if count < numberOfHeroes {
            switch Int(text) {
            case 1 :
            //player1.heroes[i].classe = "Barbare"
                player1.heroes.append(Barbare(classe: "Barbare", name: waitingName, HPInGame: game.HPClass[0]))
            case 2 :
                player1.heroes.append(Mage(classe: "Mage", name: waitingName,HPInGame: game.HPClass[1]))
            default :
                print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                onAssigneUneClasse(count:count,waitingName: waitingName)
            }
        }
        else {
        switch Int(text) {
        case 1 :
            player2.heroes.append(Barbare(classe: "Barbare", name: waitingName,HPInGame: game.HPClass[0]))
        case 2 :
            player2.heroes.append(Mage(classe: "Mage", name: waitingName,HPInGame: game.HPClass[1]))
        default :
            print("Je n'ai pas compris. Répétez, s'il vous plaît.")
           onAssigneUneClasse(count: count, waitingName: waitingName)
                }
            }
        }
    }
    
    func statePlayer1() {
        for i in 0..<player1.heroes.count {
        print("\(player1.heroes[i].name) est un \(player1.heroes[i].classe)")
        print("Il possède \(player1.heroes[i].equipment),")
        if player1.heroes[i].attack > 0 {
            print("une attaque de \(player1.heroes[i].attack)")
            }
            else {
                print("soigne \(-player1.heroes[i].attack) PV, ")
            }
            print("et a \(player1.heroes[i].HP) PV \n")
        }
    }
    
    func statePlayer2() {
        for i in 0..<player2.heroes.count {
            print("\(player2.heroes[i].name) est un \(player2.heroes[i].classe)")
            print("Il possède \(player2.heroes[i].equipment),")
            if player2.heroes[i].attack > 0 {
                print("une attaque de \(player2.heroes[i].attack)")
                }
                else {
                    print("soigne \(-player2.heroes[i].attack) PV, ")
                }
                print("et a \(player2.heroes[i].HP) PV \n")
            }
    }
    
    func HPPlayers() {
        HPPlayer1 = 0
        for i in 0 ..< player1.heroes.count {
           HPPlayer1 += player1.heroes[i].HPInGame
        }
        print("Il reste \(HPPlayer1) aux héros de \(player1.name)")
        HPPlayer2 = 0
        for i in 0 ..< player2.heroes.count {
           HPPlayer2 += player2.heroes[i].HPInGame
        }
        print("Il reste \(HPPlayer2) aux héros de \(player2.name)")
    }
        
    // MARK: Combat entre les héros
    func startFight() {
        
        let pièce = Int(arc4random_uniform(UInt32(2)))
        if pièce == 0 {
            print("\(player1.name) commence.")
            player1.myGo = true
        }
        else {
            print("\(player2.name) commence.")
            player2.myGo = true
        }
        while HPPlayer1 > 0 && HPPlayer2 > 0 { // while les deux joueurs ont encore des HP
        if player1.myGo {
            print("\(player1.name), qui envoyez-vous au combat ?")
            if player1.heroes[0].HPInGame > 0 {
                print("1. \(player1.heroes[0].name) ?")
            }
            if player1.heroes[1].HPInGame > 0 {
                print("2. \(player1.heroes[1].name) ?")
            }
            if player1.heroes[2].HPInGame > 0 {
                print("3. \(player1.heroes[2].name) ?")
            }
            if let answer1 = readLine() {
                Attacker = player1.heroes[Int(answer1)!-1]
                nbAttacker = Int(answer1)!-1
            }
            if Attacker.attack > 0 {
            print("Qui souhaitez-vous attaquer ?")
            if player2.heroes[0].HPInGame > 0 {
                print("1. \(player2.heroes[0].name) ?")
            }
            if player2.heroes[1].HPInGame > 0 {
                print("2. \(player2.heroes[1].name) ?")
            }
            if player2.heroes[2].HPInGame > 0 {
                print("3. \(player2.heroes[2].name) ?")
            }
            if let answer2 = readLine() {
                Attacked = player2.heroes[Int(answer2)!-1]
                nbAttacked = Int(answer2)!-1
            }
            Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
            }
            else {
                print("Qui souhaitez-vous soigner ?")
                if player1.heroes[0].HPInGame > 0 {
                    print("1. \(player1.heroes[0].name) ?")
                }
                if player1.heroes[1].HPInGame > 0 {
                    print("2. \(player1.heroes[1].name) ?")
                }
                if player1.heroes[2].HPInGame > 0 {
                    print("3. \(player1.heroes[2].name) ?")
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
            if player2.heroes[0].HPInGame > 0 {
                print("1. \(player2.heroes[0].name) ?")
            }
            if player2.heroes[1].HPInGame > 0 {
                print("2. \(player2.heroes[1].name) ?")
            }
            if player2.heroes[2].HPInGame > 0 {
                print("3. \(player2.heroes[2].name) ?")
            }
            if let answer1 = readLine() {
                Attacker = player2.heroes[Int(answer1)!-1]
                nbAttacker = Int(answer1)!-1
            }
            if Attacker.attack > 0 {
            print("Qui souhaitez-vous attaquer ?")
            if player1.heroes[0].HPInGame > 0 {
                print("1. \(player1.heroes[0].name) ?")
            }
            if player1.heroes[1].HPInGame > 0 {
                print("2. \(player1.heroes[1].name) ?")
            }
            if player1.heroes[2].HPInGame > 0 {
                print("3. \(player1.heroes[2].name) ?")
            }
            if let answer2 = readLine() {
                Attacked = player1.heroes[Int(answer2)!-1]
                nbAttacked = Int(answer2)!-1
            }
            Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
            }
            else {
                print("Qui souhaitez-vous soigner ?")
                if player2.heroes[0].HPInGame > 0 {
                    print("1. \(player2.heroes[0].name) ?")
                }
                if player2.heroes[1].HPInGame > 0 {
                    print("2. \(player2.heroes[1].name) ?")
                }
                if player2.heroes[2].HPInGame > 0 {
                    print("3. \(player2.heroes[2].name) ?")
                }
                if let answer2 = readLine() {
                    Attacked = player2.heroes[Int(answer2)!-1]
                    nbAttacked = Int(answer2)!-1
                }
                Fight(Attacker:Attacker,nbAttacker:nbAttacker,Attacked:Attacked,nbAttacked:nbAttacked)
            }
        }
        game.HPPlayers()
        player1.myGo = !player1.myGo
        player2.myGo = !player2.myGo
    } // Fin du while
        print("Combat terminé.")
    }
    
    
    func Fight(Attacker:Hero,nbAttacker:Int,Attacked:Hero,nbAttacked:Int) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        if Attacker.attack > 0 {                                            // En fait en possédant le numéro, Attacker et Attacked ne sont plus utiles
            print("\(Attacker.name) tape sur \(Attacked.name)")
            if (player1.myGo) {
                player2.heroes[nbAttacked].HPInGame -= player1.heroes[nbAttacker].attack
                print("\(player2.heroes[nbAttacked].name) perd \(player1.heroes[nbAttacker].attack)PV. Il lui reste \(player2.heroes[nbAttacked].HPInGame)PV")
            }
            else {
                    player1.heroes[nbAttacked].HPInGame -= player2.heroes[nbAttacker].attack
                print("\(player1.heroes[nbAttacked].name) perd \(player2.heroes[nbAttacker].attack)PV. Il lui reste \(player1.heroes[nbAttacked].HPInGame)PV")
                }
        }
        else {
            print("\(Attacker.name) soigne \(Attacked.name)")
            if (player1.myGo) {
                player1.heroes[nbAttacked].HPInGame -= player1.heroes[nbAttacker].attack
                print("\(player1.heroes[nbAttacked].name) gagne \(-player1.heroes[nbAttacker].attack)PV. Il a maintenant \(player1.heroes[nbAttacked].HPInGame)PV")
            }
            else {
                    player2.heroes[nbAttacked].HPInGame -= player2.heroes[nbAttacker].attack
                print("\(player2.heroes[nbAttacked].name) gagne \(-player2.heroes[nbAttacker].attack)PV. Il a maintenant \(player2.heroes[nbAttacked].HPInGame)PV")
                }
        }
    }
}
