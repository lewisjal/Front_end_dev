//
//  ViewController.swift
//  GestureGame
//
//  Created by M_955328 on 2/17/22.
//

import UIKit
class ViewController: UIViewController {
    
    var gameFrame: UIView!
    var scoreFrame: UILabel!
    var score: UILabel!
    var gameGestureLabel: UILabel!
    var gestureArray = ["O", "OO", "v", "^", "<", ">"]
    var scoreCount : Int = 0
    var tapCounter : Int = 0
    var counter : Int = 4
    var timer : Timer!
    var restartGameButton : UIButton! //Changed name of button: Jalin
    var startGameButton: UIButton!  //Changed name of button: Jalin
    var timerLabel: UILabel!
    var gameOverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameFrame = UIView()
        gameFrame.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height - 300)
        gameFrame.backgroundColor = .systemTeal
        self.view.addSubview(gameFrame)
        
        gameGestureLabel = UILabel()
        gameGestureLabel.frame = CGRect(x: (gameFrame.frame.width/2)-30, y: gameFrame.frame.height/2, width: 60, height: 60)
        gameGestureLabel.backgroundColor = .systemRed
        gameGestureLabel.text = gestureArray[Int.random(in: 0..<6)]
        gameGestureLabel.textColor = .white
        gameGestureLabel.textAlignment = .center
        gameGestureLabel.isHidden = true
        self.view.addSubview(gameGestureLabel)
        
        scoreFrame = UILabel()
        scoreFrame.frame = CGRect(x: 0, y: self.view.frame.height - 248, width: self.view.frame.width/2, height: 100)
        scoreFrame.backgroundColor = .systemOrange
        scoreFrame.text = "Score"
        scoreFrame.textAlignment = .center
        scoreFrame.font = scoreFrame?.font.withSize(30)
        scoreFrame.textColor = .white
        self.view.addSubview(scoreFrame)
        
        score = UILabel()
        score.frame = CGRect(x: scoreFrame.frame.width, y: self.view.frame.height - 248, width: self.view.frame.width/2, height: 100)
        score.backgroundColor = .systemOrange
        score.text = "0"
        score.textAlignment = .center
        score.font = scoreFrame?.font.withSize(30)
        score.textColor = .white
        self.view.addSubview(score)
        
        restartGameButton = UIButton()
        restartGameButton.frame = CGRect(x: (gameFrame.frame.width/2), y: gameFrame.frame.height, width: 100, height: 60)
        restartGameButton.setTitle("Restart", for: .normal)
        restartGameButton.setTitleColor(.black, for: .normal)
        restartGameButton.backgroundColor = .white
        restartGameButton.center = self.view.center
        restartGameButton.addTarget(self, action: #selector(restartButtonClicked), for: .touchDown)
        restartGameButton.isHidden = true
        self.view.addSubview(restartGameButton)
        
        startGameButton = UIButton()
        startGameButton.frame = CGRect(x: Int(gameFrame.frame.width) / Int(3.05), y: Int(gameFrame.frame.height) / 2, width: 110, height: 60)
        startGameButton.backgroundColor = .gray
        startGameButton.setTitle("Start", for: .normal)
        startGameButton.setTitleColor(.black, for: .normal)
        startGameButton.addTarget(self, action: #selector(startGameFunction), for: .touchUpInside)
        self.view.addSubview(startGameButton)
        
        timerLabel = UILabel()
        timerLabel.frame = CGRect(x: CGFloat(Int(self.view.frame.width - 50)), y: gameGestureLabel.frame.maxY, width: restartGameButton.frame.width, height: restartGameButton.frame.height)
        timerLabel.isHidden = true
        self.view.addSubview(timerLabel)
        
        gameOverLabel = UILabel()
        gameOverLabel.frame = CGRect(x: restartGameButton.frame.minX, y: gameFrame.frame.height / 3, width: self.view.frame.width / 4, height: self.view.frame.height / 3)
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.textColor = .red
        gameOverLabel.font.withSize(10)
        
        
        
// Tap once
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
//        self.view.removeGestureRecognizer(tapGesture)
// Tap twice
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView2))
        doubleTapGesture.numberOfTapsRequired = 2
        tapGesture.require(toFail: doubleTapGesture);
        self.view.addGestureRecognizer(doubleTapGesture)
// Swipe Right
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRightGesture.direction = .right
        self.view.addGestureRecognizer(swipeRightGesture)
// Swipe Left
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeftGesture.direction = .left
        self.view.addGestureRecognizer(swipeLeftGesture)
// Swipe Up
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        swipeUpGesture.direction = .up
        self.view.addGestureRecognizer(swipeUpGesture)
// Swipe Down
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
    }
    
    
    func startTimer(){
//        intitiate timer and hide game function
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        gameGestureLabel.isHidden = false
        timerLabel?.text = "\(counter)"
    }
    
    func restartTimer(){
//        reset timer after game endstimer
        startTimer()
    }
    
    func correctGesture(){
//        function to track correct gestures
        scoreCount += 100
        score.text = "\(scoreCount)"
        gameGestureLabel.text = gestureArray[Int.random(in: 0..<6)]
        counter = 4
    }
    
    func gameOver(){
//        fires when timer runs out and game ends shows restart button
        scoreCount = 0
        score.text = "\(scoreCount)"
        counter = 4
        timer.invalidate()
        restartGameButton.isHidden = false
        gameGestureLabel.isHidden = true
        timerLabel.isHidden = true
        self.view.addSubview(gameOverLabel)
    }
    
    @objc func startGameFunction(){
//      starts timer for game
        startTimer()
        startGameButton.isHidden = true
        timerLabel.isHidden = false
    }
    
    
    @objc func tapView1 () {
        correctGesture()
        print("You tapped")
    }
    
    @objc func tapView2 () {
        correctGesture()
    }
    
    @objc func swipeRight(){
        correctGesture()
    }
    
    @objc func swipeLeft(){
        correctGesture()
    }
    
    @objc func swipeUp(){
        correctGesture()
    }
    
    @objc func swipeDown(){
        correctGesture()
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            counter -= 1
            timerLabel?.text = "\(counter)"
        }
        else {
            gameOver()
        }
    }
    
    @objc func restartButtonClicked(){
//        restarts the game
        restartTimer()
        gameOverLabel.isHidden = true
        restartGameButton.isHidden = true
    }
}


