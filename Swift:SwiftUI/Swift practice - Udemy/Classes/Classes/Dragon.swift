//
//  Dragon.swift
//  Classes
//
//  Created by M_955328 on 4/6/22.
//
class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String){
        print("Says: \(speech)")
    }
    
    override func move() {
        print("Flys forwards")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage")
    }
}
