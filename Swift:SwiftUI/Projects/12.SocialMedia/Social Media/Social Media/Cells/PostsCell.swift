//
//  PostsCell.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

import Foundation

import UIKit
import WebKit

class PostsCell: UITableViewCell {
    var userTitle: UILabel!
    var userComment: UILabel!

    
    var users: PostsModal?
//    var state: CurrentState = .notDownloaded
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userTitle = UILabel(frame: CGRect(x: 10, y: 10, width: 300, height: 40))
        self.addSubview(userTitle)
        
        userComment = UILabel(frame: CGRect(x: 10, y: 30, width: 300, height: 40))
        self.addSubview(userComment)
    }
             required init(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }

}
