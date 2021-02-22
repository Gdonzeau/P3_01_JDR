//
//  Player.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 19/02/2021.
//

import Foundation

class Player {
    static var name = ""
    var heroes = [Hero]()
    var myGo = false
    var nameAlreadyExists = false
    var numberOfPlayers = 2
    var numberOfHeroes = 3
    
    func state() { // On présente les personnages du joueur 1
        for i in 0..<self.heroes.count {
            print("\(self.heroes[i].name) est un \(self.heroes[i].classe)")
            print("Il possède \(self.heroes[i].equipment),")
            if self.heroes[i].attack > 0 {
                print("une attaque de \(self.heroes[i].attack)")
            }
            else {
                print("soigne \(-self.heroes[i].attack) PV, ")
            }
            print("et a \(self.heroes[i].HP) PV \n")
        }
    }
    
    func classAssignation(count:Int,waitingName:String) { // On recoit le nom proposé et on lui choisit une carrière
        print("Quelle carrière affectez-vous à votre perso \(waitingName) ?"
                + "\n 1.Barbare"
                + "\n 2.Mage")
        if let text = readLine() {
            
                switch Int(text) {
                case 1 :
                    //player1.heroes[i].classe = "Barbare"
                    self.heroes.append(Barbare(classe: game.nameClass[0], name: waitingName, HPInGame: game.HPClass[0],equipmentInGame: game.equipmentClass[0]))
                case 2 :
                    self.heroes.append(Mage(classe: game.nameClass[1], name: waitingName,HPInGame: game.HPClass[1],equipmentInGame: game.equipmentClass[1]))
                default :
                    print("Je n'ai pas compris. Répétez, s'il vous plaît.")
                    classAssignation(count:count,waitingName: waitingName)
                }
        }
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
            print("\(Player.name), comment appelez-vous votre héros \(count+1)?")
        }
        else { // Sinon, c'est player2
            print("\(Player.name), comment appelez-vous votre héros \(count-numberOfHeroes+1) ?")
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
    
    func HPPlayers() {
        
        var HPPlayer = 0
        for i in 0 ..< self.heroes.count {
            HPPlayer += self.heroes[i].HPInGame
        }
        print("Il reste \(HPPlayer) aux héros de \(Player.name)")
    }
}
