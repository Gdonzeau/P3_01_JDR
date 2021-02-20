//
//  main.swift
//  P3_01_JDR
//
//  Created by Guillaume Donzeau on 15/02/2021.
//

import Foundation


var game = Game()

var player1 = Player()
var player2 = Player()




game.giveNameToPlayer1()
game.giveNameToPlayer2()

//game.createHeroes()
game.creationHeroes(Startcount: 0)

print("Le joueur \(player1.name) a les héros \(player1.heroes[0].name), \(player1.heroes[1].name), \(player1.heroes[2].name)")
print("Le joueur \(player2.name) a les héros \(player2.heroes[0].name), \(player2.heroes[1].name), \(player2.heroes[2].name)")



/*
//game.classAssignation()
// Les héros préparent leur équipement
for i in 0..<3 {
player1.heroes[i].changeWeapon()
}
for i in 0..<3 {
player2.heroes[i].changeWeapon()
}
 */
// Mettre le code en dessous dans une fonction, mais pas ce soir.
for i in 0..<3 {
print("\(player1.heroes[i].name) est un \(player1.heroes[i].classe)")
print("Il possède \(player1.heroes[i].equipmentInGame),")
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
    print("Il possède \(player2.heroes[i].equipmentInGame),")
    if player2.heroes[i].attack > 0 {
        print("une attaque de \(player2.heroes[i].attack)")
        }
        else {
            print("soigne \(-player2.heroes[i].attack) PV, ")
            
        }
        print("et a \(player2.heroes[i].HP) PV \n")
    }

