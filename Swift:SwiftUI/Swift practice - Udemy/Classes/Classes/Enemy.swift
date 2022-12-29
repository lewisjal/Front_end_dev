//
//  Enemy.swift
//  Classes
//
//  Created by M_955328 on 4/6/22.
//

class Enemy{
    
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStength: Int) {
        self.health = health
        self.attackStrength = attackStength
    }
    
    func takeDamage(amount: Int){
        health = health - amount
    }
    
    func move() {
        print("walk forward.")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrength) damage")
    }
}
