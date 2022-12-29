//
//  CommentsCell.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

import Foundation

import UIKit
import WebKit

class CommentsCell: UITableViewCell {
    var commentName: UILabel!
    var commentBody: UILabel!
    var commentEmail: UILabel!
    var users: PostsModal?
//    var state: CurrentState = .notDownloaded
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commentName = UILabel(frame: CGRect(x: 10, y: 10, width: 300, height: 40))
        self.addSubview(commentName)
        
        commentBody = UILabel(frame: CGRect(x: 10, y: 30, width: 300, height: 40))
        self.addSubview(commentBody)
        
        commentEmail = UILabel(frame: CGRect(x: 10, y: 50, width: 300, height: 40))
        self.addSubview(commentEmail)
    }
             required init(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }

}
