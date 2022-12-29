//
//  UsersTableViewCell.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

import UIKit

protocol UsersTableViewCellDelegate: AnyObject{
    func didTapUserImageButton()
}

class UsersTableViewCell: UITableViewCell {
    
    var users: UserModal?
    
    weak var delegate: UsersTableViewCellDelegate?
    
    @IBOutlet var userButton: UIButton!
    @IBOutlet var userName: UILabel!
    
    static let identifier = "UsersTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "UsersTableViewCell", bundle: nil)
    }
    
    func configure(with title: String){
        userName.text = title
    }
    
    @IBAction func didTapUserImageButton(){
        delegate?.didTapUserImageButton()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        userButton.setImage(UIImage(named: "userProfileImage.jpg"), for: .normal)
    }
    
}
