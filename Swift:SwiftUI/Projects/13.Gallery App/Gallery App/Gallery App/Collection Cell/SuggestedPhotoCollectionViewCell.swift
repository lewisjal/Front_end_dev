//
//  SuggestedPhotoCollectionViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/10/22.
//

import UIKit

class SuggestedPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var suggestedPhotoImage: UIImageView!
    
    static let identifier = "SuggestedPhotoCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SuggestedPhotoCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: Model){
        self.suggestedPhotoImage.image = UIImage(named: model.imageName)
        self.suggestedPhotoImage.contentMode = .scaleAspectFill
        
    }

}
