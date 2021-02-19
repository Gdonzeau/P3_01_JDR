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
    var caracteristics = ["Barbare","Mage",
                            "120","80",
                            "une épée","un sort de soin"]
    enum gameState {
        case over
        case going
    }
    var state:gameState = .going
    var Players = [player1,player2]
    var nameAlreadyExists = false
    
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
    /*
    func giveNameToHeroes() { // On ne remplit les cases du tableau des noms que si le nom proposé n'existe pas déjà.
        for count in 0 ..< numberOfHeroes*numberOfPlayers {
            if (count < numberOfHeroes && player1.heroes[count].name == "") || (count > 2 && player2.heroes[count-player1.heroes.count].name == ""){ // On cherche la première case vide dans le tableau des noms (au début chez le joueur 1, puis chez le joueur 2
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
    */
    
    /*
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
    */
    
    // MARK: Assignation des classes aux héros
    
    /*
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
    */
    
    
    func createHeroes() {
        for count in 0..<numberOfHeroes*numberOfPlayers {
         //   askName(count:count)
            /*
            func askName() {
            if count<numberOfHeroes {
                print("\(player1.name), comment appelez-vous votre héros \(count+1)?")
            }
            else {
                print("\(player2.name), comment appelez-vous votre héros \(count-numberOfHeroes+1) ?")
            }
        }
            */
            if let nameHero = askName(count: count) {
                print("Ok")
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                   askName(count:count)
                    //break
                }
                else {
                    let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                    // Et on passe à la classe
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                    
                }
            }
        }
    }
    
    func askName(count:Int) ->String?{
        var retour = ""
    if count<numberOfHeroes {
        print("\(player1.name), comment appelez-vous votre héros \(count+1)?")
    }
    else {
        print("\(player2.name), comment appelez-vous votre héros \(count-numberOfHeroes+1) ?")
    }
        if let nameHero = readLine() {
            retour = nameHero
        }
        print("\(retour)")
        return retour
}
    
    /*
    func giveNameToHeroesBis (count:Int)->String { // Renvoie le nom choisi pour le héros
        return "Voilà"
    }
    */
    func checkHeroesNameBis(nameToCheck: String) -> Bool {
        print("Vérif")
        /*
        if let Test = player1.heroes.name {
            names1Used = Test
        }
        
        let names2Used = player2.heroes.name
 */
        /*
            [player1.heroes[0].name,player1.heroes[1].name,player1.heroes[2].name,
                         player2.heroes[0].name,player2.heroes[1].name,player2.heroes[2].name]
 */
        //for name in names1Used {
     //   if player1.heroes.count != 1 {
    for i in 0 ..< player1.heroes.count {
        print("Je vérifie le tableau P1")
        for name in player1.heroes[i].name {
            if nameToCheck == String(name) {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
                break
            }
        }
    }
        print("P1")
    for i in 0 ..< player2.heroes.count {
        print("Je vérifie le tableau P2")
        for name in player2.heroes[i].name {
            if nameToCheck == String(name) {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
                break
                }
            else {
                nameAlreadyExists = false
            }
            }
        }
        print("P2")
        print("nameAlreadyExists = \(nameAlreadyExists)")
    return nameAlreadyExists
    }
    
    func onAssigneUneClasse(count:Int,waitingName:String) {
    print("Quelle carrière affectez-vous à votre perso ?"
    + "\n 1.Barbare"
    + "\n 2.Mage")
    if let text = readLine() {
        if count < numberOfHeroes {
            switch Int(text) {
            case 1 :
            //player1.heroes[i].classe = "Barbare"
                player1.heroes.append(Barbare(classe: "Barbare", name: waitingName))
            case 2 :
                player1.heroes.append(Mage(classe: "Mage", name: waitingName))
            default :
                print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                onAssigneUneClasse(count:count,waitingName: waitingName)
            }
        }
        else {
        switch Int(text) {
        case 1 :
        //player1.heroes[i].classe = "Barbare"
            player2.heroes.append(Barbare(classe: "Barbare", name: waitingName))
        case 2 :
            player2.heroes.append(Mage(classe: "Mage", name: waitingName))
        default :
            print("Je n'ai pas compris. Répétez, s'il vous plaît.")
           onAssigneUneClasse(count: count, waitingName: waitingName)
        }
    }
    }
    /*
    if count < 3 {
        player1.heroes[count].name = nameHero
        }
    else {
        player2.heroes[count-3].name = nameHero
            }
        */
    }
        
      //  }
    
    /*
    func classAssignationBis(count:Int)->Hero { // Renvoie la classe choisie pour le héros
        return 
    }
    */
    // MARK: Combat entre les héros
    
    func Fight(Attacker:String,Attacked:String) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        
    }
}
