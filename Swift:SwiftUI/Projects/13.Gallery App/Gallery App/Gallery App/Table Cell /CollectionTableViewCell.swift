//
//  CollectionTableViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/9/22.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    func configure(with model: [Model]){
        self.model = model
        self.cellTitle.text = "Recents"
        collectionView.reloadData()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellTitle: UILabel!

    
    var model = [Model]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(PhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell {
            cell.configure(with: model[indexPath.row])
            return cell
        }
        return PhotoCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
