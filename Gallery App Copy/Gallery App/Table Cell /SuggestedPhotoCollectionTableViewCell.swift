//
//  SuggestedPhotoCollectionTableViewCell.swift
//  Gallery App
//
//  Created by M_955328 on 3/10/22.
//

import UIKit

class SuggestedPhotoCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Static variables and functions and local variables
    
    static let identifier = "SuggestedPhotoCollectionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName:"SuggestedPhotoCollectionTableViewCell", bundle: nil)
    }

    @IBOutlet weak var suggestedPhotoCollectionView: UICollectionView!
    @IBOutlet weak var suggestedCellTitle: UILabel!
    
    var model = [Model]()
    
    var timer = Timer()
    var counter = 0
    
    //MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async { [self] in
            timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        suggestedPhotoCollectionView.register(SuggestedPhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: SuggestedPhotoCollectionViewCell.identifier)
        suggestedPhotoCollectionView.delegate = self
        suggestedPhotoCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Functions
    func configure(with model: [Model]){
        self.model = model
        self.suggestedCellTitle.text = "Suggested"
        suggestedPhotoCollectionView.reloadData()
    }
    
    @objc func changeImage(){
        if counter < model.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.suggestedPhotoCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.suggestedPhotoCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = suggestedPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: SuggestedPhotoCollectionViewCell.identifier, for: indexPath) as? SuggestedPhotoCollectionViewCell {
            cell.configure(with: model[indexPath.row])
            return cell
        }
        return SuggestedPhotoCollectionViewCell()
    }
    
    //MARK: - Collection View Flow Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = suggestedPhotoCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
