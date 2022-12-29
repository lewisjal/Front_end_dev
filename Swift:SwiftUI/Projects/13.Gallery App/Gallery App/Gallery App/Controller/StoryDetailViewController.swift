//
//  StoryDetailViewController.swift
//  Gallery App
//
//  Created by M_955328 on 3/14/22.
//

import UIKit

class StoryDetailViewController: UIViewController{
    
    var model: Model?

    
    
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = model?.imageName else {return}
//
        storyTitle.text = model?.text
        storyImage.image = UIImage(named: image)
    }
}
