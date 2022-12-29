//
//  CommentsViewController.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var comments = [CommentsModal]()
    var commentModel: CommentsModal?
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentComment = comments[indexPath.row]
        let cell = CommentsCell(style: .default, reuseIdentifier: "comments")
        cell.commentName.text = currentComment.name
        cell.commentBody.text = currentComment.body
        cell.commentEmail.text = currentComment.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
