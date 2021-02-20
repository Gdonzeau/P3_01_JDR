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
    var nameClass = ["Barbare","Mage"]
    var EquipmentClass = ["une épée","un sort de soin"]
    var HPClass = [120,80]
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
    
    
    // MARK: Assignation des classes aux héros
    
    
    
    
    func createHeroes() {
        for count in 0..<numberOfHeroes*numberOfPlayers {
           // if let nameHero = askName(count: count) {
            if count == 0 && player1.heroes.count == 0{
                    if let nameHero = askName(count: count) {
                    let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                    print("J'envoie \(waitingName) se faire assigner une classe")
                    // Et on passe à la classe
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                    }
                }
            if count == 0 && player1.heroes.count > 0 {
                if let nameHero = askName(count: count) {
                    
                }
            }
                else {
                   // if count < 3 {
                    if let nameHero = askName(count: count) {
          //  if player1.heroes.count > 0 {
               // if player1.heroes[count-1].name == "" || player2.heroes[count-1].name == "" {
            // Ajouter ligne pour s'arrêter aux cases ""
        //    if (count < player1.heroes.count && player1.heroes[count].name == "") { //|| (count > player1.heroes.count-1 && player2.heroes[count-player1.heroes.count].name == "") {
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
          //  if let nameHero = askName(count: count) {
                    
                print("Ok, je reçois \(nameHero)")
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                   createHeroes()
                }
                else {
                    let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                    print("J'envoie \(waitingName) se faire assigner une classe")
                    // Et on passe à la classe
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
           }
       // }
        }
    }
    
    func creationHeroes(Startcount:Int) {
    for count in Startcount..<numberOfHeroes*numberOfPlayers {
        if let nameHero = askName(count: count) {
            if count == 0 {
                let waitingName = nameHero // On a vérifié que le nom n'existe pas. On le stocke dans une variable pour la suite.
                print("J'envoie \(waitingName) se faire assigner une classe")
                // Et on passe à la classe
                onAssigneUneClasse(count: count,waitingName:waitingName)
            }
            else if count == 1 {
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
            else if count == 2 {
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
            else if count == 3 {
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
            else if count == 4 {
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
            }
            else if count == 5 {
                if (checkHeroesNameBis(nameToCheck: nameHero)) { // Si un nom identique existe, on ne remplit pas la case nom et on relance la fonction
                    creationHeroes(Startcount:count)
                }
                else {
                    let waitingName = nameHero
                    onAssigneUneClasse(count: count,waitingName:waitingName)
                }
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
    
    func checkHeroesNameBis(nameToCheck: String) -> Bool {
        print("Vérif")
        /*
        for i in 0 ..< player1.heroes.count { // On fait un tableau interne de la liste des noms.
            print("\(player1.heroes[i].name)")
            var verif = [String]()
            verif.append(player1.heroes[i].name)
        }
        */
        
    for i in 0 ..< player1.heroes.count {
        print("Je vérifie le tableau P1")
     //   for name in player1.heroes[i].name {
           // if nameToCheck == String(name) {
            if nameToCheck == player1.heroes[i].name {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
                break
            }
            else {
                print("\(nameToCheck) est différent de \(player1.heroes[i].name)")
            }
      //  }
    }
        print("P1")
    for i in 0 ..< player2.heroes.count {
        print("Je vérifie le tableau P2")
      //  for name in player2.heroes[i].name {
      //      if nameToCheck == String(name) {
        if nameToCheck == player2.heroes[i].name {
                print("Ce nom existe déjà.")
                nameAlreadyExists = true
                break
                }
            else {
                nameAlreadyExists = false
                print("\(nameToCheck) est différent de \(player2.heroes[i].name)")
            }
        //    }
        }
        print("P2")
        print("nameAlreadyExists = \(nameAlreadyExists)")
    return nameAlreadyExists
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
    
    }
        
    // MARK: Combat entre les héros
    
    func Fight(Attacker:String,Attacked:String) { // Changer String. Envoyer le player.hero[rang] pour accéder facilement aux propriétés des héros
        
    }
}
