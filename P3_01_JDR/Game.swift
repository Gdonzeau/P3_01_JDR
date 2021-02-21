//
//  Game.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Game {
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
    
    // MARK: Noms et classes aux héros
    
    func creationHeroes(startCount:Int,endCount:Int) {
    for count in startCount..<endCount {
        
        if let nameHero = askName(count: count) { // On demande et reçoit le nom du héros
            if nameHero == "" { // Si le nom est déjà pris, "" est retourné
                creationHeroes(startCount: count,endCount: count+1) // Donc on redemande un nom
            }
            
            else {
                let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une constante pour la suite.
                print("J'envoie \(waitingName) se faire assigner une classe")
                // Et on passe au choix de la classe
                classAssignation(count: count,waitingName:waitingName)
                }
            }
        }
    }
    
    func askName(count:Int) ->String?{ // Fonction qui demande le nom et vérifie qu'il n'est pas déjà pris
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
        if let nameHero = readLine() { // On récupère le nom proposé
            
            for name in NamesInUse { // Et on vérifie que le nom n'existe pas déjà
                if nameHero == name {
                    print("\(nameHero) est déjà pris")
                    nameAlreadyExists = true
                    break
                }
                else {
                    print("Tout va bien") // print de debbug
                }
            }
            retour = nameHero
        }
        if nameAlreadyExists {
            retour = ""
        }
        
        print("\(retour) revient") // print de debbug
        
        return retour
    }

    func classAssignation(count:Int,waitingName:String) {
    print("Quelle carrière affectez-vous à votre perso \(waitingName) ?"
    + "\n 1.Barbare"
    + "\n 2.Mage")
    if let text = readLine() {
        if count < numberOfHeroes {
            switch Int(text) {
            case 1 :
            //player1.heroes[i].classe = "Barbare"
                player1.heroes.append(Barbare(classe: game.nameClass[0], name: waitingName, HPInGame: game.HPClass[0],equipmentInGame: game.equipmentClass[0]))
            case 2 :
                player1.heroes.append(Mage(classe: game.nameClass[1], name: waitingName,HPInGame: game.HPClass[1],equipmentInGame: game.equipmentClass[1]))
            default :
                print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                classAssignation(count:count,waitingName: waitingName)
            }
        }
        else {
        switch Int(text) {
        case 1 :
            player2.heroes.append(Barbare(classe: game.nameClass[0], name: waitingName,HPInGame: game.HPClass[0],equipmentInGame: game.equipmentClass[0]))
        case 2 :
            player2.heroes.append(Mage(classe: game.nameClass[1], name: waitingName,HPInGame: game.HPClass[1], equipmentInGame: game.equipmentClass[1]))
        default :
            print("Je n'ai pas compris. Répétez, s'il vous plaît.")
           classAssignation(count: count, waitingName: waitingName)
                }
            }
        }
    }
    
    func statePlayer1() { // On présente les personnages du joueur 1
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
    
    func statePlayer2() { // On présente les personnages du joueur 2
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
        if player1.myGo {                       // On peut facilement simplifier ces écritures par des boucles for ou on laisse comme ça pour une meilleure lisiblité ?
            // Si elle est vraiment considérée comme meilleure...
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
                magicChest(playingHero: Attacker)
            }
            if Attacker.attack > 0 {
            print("Qui souhaitez-vous attaquer ?")
            if player2.heroes[0].HPInGame > 0 {
                print("1. \(player2.heroes[0].name) ? PV restants : \(player2.heroes[0].HPInGame)")
            }
            if player2.heroes[1].HPInGame > 0 {
                print("2. \(player2.heroes[1].name) ? PV restants : \(player2.heroes[1].HPInGame)")
            }
            if player2.heroes[2].HPInGame > 0 {
                print("3. \(player2.heroes[2].name) ? PV restants : \(player2.heroes[2].HPInGame)")
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
                magicChest(playingHero: Attacker)
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
        game.HPPlayers() // On fait le bilan des blessures
            // C'est le tour de l'autre joueur
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
        }
        print("Souhaitez-vous échanger \(playingHero.equipment) contre \(game.possibleEquipment[joker])")
        print("1. Oui")
        print("2. Non")
        
        if let choice = readLine() {
            if Int(choice) == 1 {
                playingHero.equipmentInGame = game.possibleEquipment[joker]
            }
            else {
        // On pourrait aussi répéter en cas de réponse ni 1 ni 2. Mais si le joueur n'arrive pas à appuyer sur la bonne touche, c'est peut-être imprudent de lui confier une arme.
                print("On ne change pas")
            }
        }
    }
    
    
    func Fight(Attacker:Hero,nbAttacker:Int,Attacked:Hero,nbAttacked:Int) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        if Attacker.attack > 0 { // Si on attaque                           // En fait en possédant le numéro, Attacker et Attacked ne sont plus utiles
            print("\(Attacker.name) tape sur \(Attacked.name)")
            if (player1.myGo) { // Si c'est le tour du joueur 1
                player2.heroes[nbAttacked].HPInGame -= player1.heroes[nbAttacker].attack
                print("\(player2.heroes[nbAttacked].name) perd \(player1.heroes[nbAttacker].attack)PV. Il lui reste \(player2.heroes[nbAttacked].HPInGame)PV")
                if player2.heroes[nbAttacked].HPInGame<1 {
                    print("\(player2.heroes[nbAttacked].name) est mort.")
                }
            }
            else { // Si c'est le tour du joueur 2
                    player1.heroes[nbAttacked].HPInGame -= player2.heroes[nbAttacker].attack
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
        
    }

}
