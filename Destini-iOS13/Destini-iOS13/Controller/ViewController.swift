//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(storyBrain.choice)

    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        guard let choiceMade = sender.currentTitle else {return}
        
        let resultOfChoice = storyBrain.nextStory(choiceMade)
        
        if resultOfChoice == storyBrain.choice + 1{
            updateUI(storyBrain.choice)
        } else {
            updateUI(storyBrain.choice)
        }
        
    }
    
    func updateUI(_ input: Int){
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.goToFirstChoice(), for: .normal)
        choice2Button.setTitle(storyBrain.goToSecondChoice(), for: .normal)
    }


}

