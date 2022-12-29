//
//  UserCell.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

import UIKit
import Foundation
import WebKit

class UserCell: UITableViewCell{
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
}

//class UserCell: UITableViewCell {
//    var userTitle: UILabel!
//    var userimageViewShow: UIButton!
//    var activityIndicator: UIActivityIndicatorView!
//    var users: UserModal?
//    var userImage = UIImage(named: "userProfileImage")
////    var state: CurrentState = .notDownloaded
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        userTitle = UILabel(frame: CGRect(x: 120, y: 10, width: 300, height: 40))
//        self.addSubview(userTitle)
//
//        userimageViewShow = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
//        self.addSubview(userimageViewShow)
//
//        activityIndicator = UIActivityIndicatorView(frame: CGRect(x:10, y:10, width: 10, height:10))
//        self.addSubview(activityIndicator)
//    }
//             required init(coder: NSCoder) {
//        fatalError("init(coder) has not been implemented")
//    }
//
//}
