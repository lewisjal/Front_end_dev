//
//  PhotoCollectionViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/9/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    static let identifier = "PhotoCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: Model){
        self.photoLabel.text = model.text
        self.photoImageView.image = UIImage(named: model.imageName)
        self.photoImageView.contentMode = .scaleAspectFill
    }

}
