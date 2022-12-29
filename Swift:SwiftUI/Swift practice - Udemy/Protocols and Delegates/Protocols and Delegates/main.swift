//
//  main.swift
//  Protocols and Delegates
//
//  Created by M_955328 on 4/11/22.
//
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic performs chest compressions, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor performs chest compressions, 30 per second")
    }
    
    func useStethescope(){
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whir...")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
