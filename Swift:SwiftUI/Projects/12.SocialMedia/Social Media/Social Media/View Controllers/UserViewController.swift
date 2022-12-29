//
//  ViewController.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

//Remind for +1 points

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetInformation {
    
    //calling UsersStruct into scope
//    var user:  UserModal?
    var userArray = [UserModal]()
    var postArray = [PostsModal]()
    var post: PostsModal?
    
    
    @IBOutlet weak var usersTableView: UITableView!

    // loading and reloading data to be dsiplayed into the table
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataInformation()
        //usersTableView.register(UsersTableViewCell.nib(), forCellReuseIdentifier: UsersTableViewCell.identifier)
        usersTableView.delegate = self
        usersTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = usersTableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath)
//            as? UsersTableViewCell {
//            if let username = usersArray[indexPath.row].name {
//                cell.configure(with: username)
//                cell.delegate = self
//                return cell
//            }
//
        //}
        let currentUser = userArray[indexPath.row]
        guard let cell = usersTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else{
            return UserCell()
        }
//        cell = UserCell(style: .default, reuseIdentifier: "userCell")
        cell.userNameLabel.text = currentUser.name
        cell.userImage.image = UIImage(named: "userProfileImage")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapUserButton))
        tapGesture.numberOfTapsRequired = 1
        cell.userImage.tag = indexPath.row
        cell.userImage.isUserInteractionEnabled = true
        cell.userImage.addGestureRecognizer(tapGesture)
        return cell
    }
    
    func getDataInformation() {
        getUsersData{
            self.usersTableView.reloadData()
        }
        getPostsData{
            self.usersTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usersTableView.deselectRow(at: indexPath, animated: true)
        let currentPost = postArray[indexPath.row]
        guard let postsDetailVC = storyboard?.instantiateViewController(withIdentifier: "posts") as? PostDetailVC else{
            return
        }
        for post in postArray{
//            print(userArray[indexPath.row].id)
            if userArray[indexPath.row].id == post.userId!{
                print(post)
                postsDetailVC.postArray.append(post)
            }
        }
//        if currentUser.id == postInformation
//        {
//            if let iD = post?.id{
//                print(postArray[iD])
//                postsDetailVC.postArray = [postArray[iD]]
//            }
//        }
        navigationController?.pushViewController(postsDetailVC, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == profileSegueIdentifier,
//           let destination = segue.destination as? ProfileDetailVC,
//           let profileIndex = usersTableView.indexPathForSelectedRow?.row
//        {
//            destination.users = usersArray[profileIndex]
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
    
    @objc func didTapUserButton(){
        guard let profileDetailVC = storyboard?.instantiateViewController(withIdentifier: "profiles") as? ProfileDetailVC else{
            return
        }
        for user in userArray{
            if let userId = user.id{
                if user.id == userArray[userId-1].id{
                    print("Here is your user:",user)
                    profileDetailVC.userPassedArray.append(user)
                }
            }
        }
        navigationController?.pushViewController(profileDetailVC, animated: true)
    }

//JSON parsing struct for the users
    func getUsersData(completed: @escaping () -> ()){
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users"){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else {return}
                if error == nil{
                    do{
                        self.userArray = try JSONDecoder().decode([UserModal].self, from: data)
                        
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
    func getPostsData(completed: @escaping () -> ()){
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts"){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else {return}
                if error == nil{
                    do{
                        self.postArray = try JSONDecoder().decode([PostsModal].self, from: data)
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

   

//        let currentUser = users[indexPath.row]
//        let cell = UserCell(style: .default, reuseIdentifier: "userCell") //Uses custom cell for design
//        cell.userTitle.text = currentUser.name
//        cell.userimageViewShow.setImage(UIImage(named: "userProfileImage.jpg"), for: .normal)
//        //Uses custom image for background of button
//        cell.userimageViewShow.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
//        return cell
}
