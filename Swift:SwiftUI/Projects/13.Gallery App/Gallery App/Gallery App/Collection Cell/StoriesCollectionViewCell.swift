//
//  StoriesCollectionViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/11/22.
//



import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storiesImages: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    
    
    static let identifier = "StoriesCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: Model){
        print("This is the model", model)
        self.storyTitle.text = model.text
        self.storiesImages.image = UIImage(named: model.imageName)
        self.storiesImages.contentMode = .scaleAspectFill
//        self.storiesImages.clipsToBounds = true
//        self.storiesImages.layer.masksToBounds = true
        self.storiesImages.layer.cornerRadius = 50.0/2.0
    }

}
