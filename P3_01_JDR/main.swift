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

var c = Barbare(classe: "Barbare", name: "Brutus", HPInGame: 10, equipmentInGame: "une masse", weapon: Weapon.init())
print("\(c.damage), \(c.weapon.name)")
/*
game.giveNameToPlayer1()
game.giveNameToPlayer2()

//game.createHeroes()
game.creationHeroes(startCount: 0,endCount: 6)

print("Le joueur \(player1.name) a les héros \(player1.heroes[0].name), \(player1.heroes[1].name) et \(player1.heroes[2].name)")
print("Le joueur \(player2.name) a les héros \(player2.heroes[0].name), \(player2.heroes[1].name) et \(player2.heroes[2].name)")

//game.statePlayer1()
//game.statePlayer2()
player1.state()
player2.state()


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


game.HPPlayers()

game.startFight()
*/
