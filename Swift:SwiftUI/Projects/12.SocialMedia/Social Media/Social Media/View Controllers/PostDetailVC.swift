//
//  PostsDetailVC.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

import Foundation
import UIKit

class PostDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var postArray = [PostsModal]()
    var commentsArray = [CommentsModal]()
    var postModel: PostsModal?
    
//    var postsStruct: PostsStruct?
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        postsTableView.delegate = self
        postsTableView.dataSource = self
        print(postArray)
//        getPostsData {
//            self.postsTableView.reloadData()
//        }
//        getCommentData{
//            self.postsTableView.reloadData()
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentPosts = postArray[indexPath.row]
        let cell = PostsCell(style: .default, reuseIdentifier: "posts")
        cell.userTitle.text = currentPosts.title
        cell.userComment.text = currentPosts.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPosts = commentsArray[indexPath.row]
        guard let commentsVC = storyboard?.instantiateViewController(withIdentifier: "comment") as? CommentsViewController else{
            return
        }
        if currentPosts.id == commentsVC.comments[indexPath.row].postId{
            commentsVC.comments[indexPath.row] = currentPosts
        }
        navigationController?.pushViewController(commentsVC, animated: true)
    }
    
    
    func getCommentData(completed: @escaping () -> ()){
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments"){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else {return}
                if error == nil{
                    do{
                        self.commentsArray = try JSONDecoder().decode([CommentsModal].self, from: data)
                        
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch{
                        print("JSON error")
                    }
                }
            }.resume()
        }
    }
}
    


