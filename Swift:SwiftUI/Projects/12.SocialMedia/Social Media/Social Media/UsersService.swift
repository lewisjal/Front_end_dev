//
//  UsersService.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

//import Foundation
//class UsersService{
//    func getUsersData(completed: @escaping () -> ()){
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
//        URLSession.shared.dataTask(with: url!){ (data, response, error) in
//            if error == nil{
//                do{
//                    self.usersArray = try JSONDecoder().decode([UserStruct].self, from: data!)
//                    
//                    DispatchQueue.main.async {
//                        completed()
//                    }
//                } catch{
//                    print("JSON error")
//                }
//            }
//        }.resume()
//    }
//}
//func getUsersData(completed: @escaping () -> ()){
//    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
//    URLSession.shared.dataTask(with: url!){ (data, response, error) in
//        if error == nil{
//            do{
//                self.usersArray = try JSONDecoder().decode([UserStruct].self, from: data!)
//                
//                DispatchQueue.main.async {
//                    completed()
//                }
//            } catch{
//                print("JSON error")
//            }
//        }
//    }.resume()
//}
