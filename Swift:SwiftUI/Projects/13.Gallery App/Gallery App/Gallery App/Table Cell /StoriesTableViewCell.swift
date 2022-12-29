//
//  TableViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/11/22.
//

import UIKit

class StoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: StoriesTableViewCellDelegate?
        
    static let identifier = "StoriesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StoriesTableViewCell", bundle: nil)
    }
    
    func configure(with model: [Model]){
        self.model = model
        self.storyCellTitle.text = "Stories"
        storyCollectionView.reloadData()
    }
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var storyCellTitle: UILabel!
    
    var model = [Model]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyCollectionView.register(StoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifier, for: indexPath) as? StoriesCollectionViewCell {
            cell.configure(with: model[indexPath.row])
            return cell
        }
        return StoriesCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didClick(cell: self)
    }
    
    
    
}
