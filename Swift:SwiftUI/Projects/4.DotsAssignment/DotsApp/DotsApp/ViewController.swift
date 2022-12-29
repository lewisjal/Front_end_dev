//
//  ViewController.swift
//  DotsApp
//
//  Created by M_955328 on 2/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    
    //Initiates what type of element is being used in the controller
    let dot = UIButton()
    let dot1 = UIButton()
    let dot2 = UIButton()

    //Initiating timer
    var timer: Timer?
    var timer1: Timer?
    var timer2: Timer?

//    var time: Int = 0

    //set intial y and x values for stating point of each dot
    var x = 50.00
    var y = 100.00
    
    var xBallOne = 150.00
    var yBallOne = 100.00
    
    var xBallTwo = 250.00
    var yBallTwo = 100.00
    
    // increment change of x and y when condition is being met
    var deltaX = 2.00
    var deltaY = 2.00
    
    var deltaXOne = 2.00
    var deltaYOne = 2.00
    
    var deltaXTwo = 2.00
    var deltaYTwo = 2.00


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        @objc func buttonClicked(){
//            print("Button Clicked")
//        }
//        let backdrop = UIButton()
//        backdrop.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//           // need these 2 so that the background is touchable
//        backdrop.addTarget(self, action: #selector(buttonClickedBack), for: .touchUpInside)
//        backdrop.isUserInteractionEnabled = true
//        view.addSubview(backdrop)

        // creates UIButton for start of game and morphs the buttons display
        let startButton = UIButton()
        startButton.frame = CGRect(x: 0, y: self.view.frame.height-(self.view.frame.height/6), width: self.view.frame.width/2, height: self.view.frame.height/6)
        startButton.backgroundColor = .lightGray
        startButton.setTitle("Start", for: .normal)
        startButton.self.layer.borderColor = UIColor.black.cgColor
        startButton.self.layer.borderWidth = 2.0
        startButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(startButton)

        //creates a counter to keep count of the game as it is being played
        let countButton = UILabel()
        countButton.frame = CGRect(x: self.view.frame.width - (self.view.frame.width/2), y: self.view.frame.height-(self.view.frame.height/6), width: self.view.frame.width/2, height: self.view.frame.height/6)
        countButton.backgroundColor = .lightGray
        countButton.text = "Count: \(score)"
        countButton.textAlignment = .center
        countButton.self.layer.borderColor = UIColor.black.cgColor
        countButton.self.layer.borderWidth = 2.0
        self.view.addSubview(countButton)
        
        //shaping the objects in which the focus of the game is on
        dot.frame = CGRect(x: x, y: y, width: 100, height: 100)
        dot.layer.cornerRadius = 50
        dot.backgroundColor = .blue
        dot.addTarget(self, action: #selector(dotClicked), for: .touchDown)
        dot.isHidden = true
        self.view.addSubview(dot)
        
        dot1.frame = CGRect(x: xBallOne, y: yBallOne, width: 100, height: 100)
        dot1.layer.cornerRadius = 50
        dot1.backgroundColor = .yellow
        dot1.addTarget(self, action: #selector(dotClickedOne), for: .touchDown)
        dot1.isHidden = true
        self.view.addSubview(dot1)
        
        dot2.frame = CGRect(x: xBallTwo, y: yBallTwo, width: 100, height: 100)
        dot2.layer.cornerRadius = 50
        dot2.backgroundColor = .green
        dot2.addTarget(self, action: #selector(dotClickedTwo), for: .touchDown)
        dot2.isHidden = true
        self.view.addSubview(dot2)
        

        //defining the conditions of the timer
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerIsHit), userInfo: nil, repeats: true)
        timer1 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerIsHitBallOne), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerIsHitBallTwo), userInfo: nil, repeats: true)
        }

    
    //Unhidding the objects defined as "start of game"
    @objc func startbuttonClicked(){
        print("button Clicked")
        if dot.isHidden == true{
            dot.isHidden = false
        }
        if dot1.isHidden == true{
            dot1.isHidden = false
        }
        if dot2.isHidden == true{
            dot2.isHidden = false
        }

    }
    
//    @objc func buttonClickedBack(){
//
//    }
    
    @objc func dotClicked(){
        deltaX += 2
        deltaY += 2
    }
    @objc func dotClickedOne(){
        deltaXOne += 3
        deltaYOne += 3
    }
    @objc func dotClickedTwo(){
        deltaXTwo += 4
        deltaYTwo += 4
    }

    
    //Function to fire when timer is being called for movement of objects
    @objc func timerIsHit(){
//
        y = dot.frame.origin.y
        y = y + deltaX
        x = dot.frame.origin.x
        x = x + deltaY
        dot.frame = CGRect(x: x, y: y, width: 100, height: 100)
////
        if (dot.frame.origin.x + dot.frame.width) > self.view.frame.width{

            deltaX = -(-deltaX)
            deltaY = -deltaY
        }
        if dot.frame.origin.x < 0 {
            deltaX = -(-deltaX)
            deltaY = -deltaY

        }
        if dot.frame.origin.y < 0 {
            deltaY = -(-deltaY)
            deltaX = -deltaX
        }
        if (dot.frame.origin.y + dot.frame.height) > self.view.frame.height-(self.view.frame.height/6) {
            deltaY = -(-deltaY)
            deltaX = -deltaX
        }
    }

    @objc func timerIsHitBallOne(){
        yBallOne = dot1.frame.origin.y
        yBallOne = yBallOne - deltaXOne
        xBallOne = dot1.frame.origin.x
        xBallOne = xBallOne + deltaYOne
        dot1.frame = CGRect(x: xBallOne, y: yBallOne, width: 100, height: 100)
    ////
        if (dot1.frame.origin.x + dot1.frame.width) > self.view.frame.width{
            deltaXOne = -(-deltaXOne)
            deltaYOne = -(deltaYOne)
        }
        if dot1.frame.origin.x < 0 {
            deltaXOne = -(-deltaXOne)
            deltaYOne = (-deltaYOne)

        }
        if dot1.frame.origin.y < 0 {
            deltaYOne = -(deltaYOne)
            deltaXOne = -(deltaXOne)
        }
        if (dot1.frame.origin.y + dot.frame.height) > self.view.frame.height-(self.view.frame.height/6) {
            deltaYOne = -(-deltaYOne)
            deltaXOne = -deltaXOne
        }
    }
    @objc func timerIsHitBallTwo(){
        yBallTwo = dot2.frame.origin.y
        yBallTwo = yBallTwo + deltaXTwo
        xBallTwo = dot2.frame.origin.x
        xBallTwo = xBallTwo - deltaYTwo
        dot2.frame = CGRect(x: xBallTwo, y: yBallTwo, width: 100, height: 100)
    ////
        if (dot2.frame.origin.x + dot2.frame.width) > self.view.frame.width{
            deltaXTwo = -(-deltaXTwo)
            deltaYTwo = -(deltaYTwo)
        }
        if dot2.frame.origin.x < 0 {
            deltaXTwo = -(-deltaXTwo)
            deltaYTwo = (-deltaYTwo)
                
        }
        if dot2.frame.origin.y < 0 {
            deltaYTwo = -(deltaYTwo)
            deltaXTwo = -(-deltaXTwo)
        }
        if (dot2.frame.origin.y + dot.frame.height) > self.view.frame.height-(self.view.frame.height/6) {
            deltaYTwo = -(-deltaYTwo)
            deltaXTwo = -deltaXTwo
        }
    }
}
