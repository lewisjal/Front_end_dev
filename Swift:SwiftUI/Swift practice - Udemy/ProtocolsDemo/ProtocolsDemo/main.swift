//
//  main.swift
//  ProtocolsDemo
//
//  Created by M_955328 on 4/10/22.
//
protocol CanFly{
    func fly()
}

extension CanFly {
    func fly() {
        print("The object takes off into the air.")
    }
}


class Bird {
    
    var isFemale = true
    
    func layEggs(){
        print("The bird makes a new bird in a shell")
    }
}

class Eagle: Bird, CanFly {
    
    func soar() {
        print("The eagle glides in the air using the air currents")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water")
    }
}

struct Airplane: CanFly {
    func loadedPlane() {
        print("The plane has been loaded and is clear for takeoff")
    }
}

struct FlyingMuseum {
    func flyingDemo(_ flyingObject: CanFly){
        flyingObject.fly()
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()
myPlane.loadedPlane()
myPlane.fly()


//let museum = FlyingMuseum()
//museum.flyingDemo(myEagle)
//museum.flyingDemo(Airplane())
