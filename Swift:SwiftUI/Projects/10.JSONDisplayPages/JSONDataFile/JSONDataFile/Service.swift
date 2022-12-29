//
//  DataFetch.swift
//  JSONDataFile
//
//  Created by M_955328 on 3/1/22.
//

import Foundation
import UIKit

let task = URLSession.shared

class Service {
    
    private var dataTask: URLSessionDataTask?
    
    func getPhotosData(completion: @escaping (Result<[PhotosData], Error>) -> Void){
        let photoURL = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: photoURL) else {return}
        
        //Create URL session- wokr on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //HAndle error
            if let error = error {
                completion(.failure(error))
                print("Data task error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                //Handle empty response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                //Handle empty data
                print("Empty Data")
                return
            }
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([PhotosData].self, from: data)
                
                DispatchQueue.main.async{
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
//
//    let hostURL =  "https://jsonplaceholder.typicode.com/posts"
//
//    let task = URLSession.shared
//
//    func getDataFromServer(completion : @escaping (Data?) -> ()) {
//
//        let fullURl = "\(hostURL)"
//
//        if let url = URL(string: fullURl) {
//
//            let dataTask = task.dataTask(with: URLRequest(url: url)) { data, response, error in
//                if error != nil  {
//                    print("Some error")
//                } else {
//                    if let usableData = data {
//                        // Checking if data exist.
//                        print(usableData)
//                        completion(data ?? Data())
//                        // printing Data.
//                    }
//                }
//            }
//            dataTask.resume()
//        }
//    }
}


//import Foundation
//import UIKit
//
//let task = URLSession.shared
//
//class DataFetch {
//
////    private var dataTask1: URLSessionDataTask?
//    let task = URLSession.shared
//
//
//    func fetchData(at url: URL, completion: @escaping (Result<[MyResult], Error>)-> Void){
//
//        let photosURL = "https://jsonplaceholder.typicode.com/photos"
//        guard let url = URL(string: photosURL) else {return}
//        let dataTask = task.dataTask(with: url){ (data, response, error) in
//            if let error = error{
//                completion(.failure(error))
//                print("Datatask error: \(error.localizedDescription)")
//                return
//            }
//            guard let response = response as? HTTPURLResponse else{
//                print("Empty Response")
//                return
//            }
//            print("Response status code: \(response.statusCode)")
//            guard let data = data else {
//                print("Empty data")
//                return
//            }
//                do{
//                    let myResult = try JSONDecoder().decode([MyResult].self, from: data)
//                    DispatchQueue.main.async {
//                        completion(.success(myResult))
//                    }
//                } catch let decoderError {
//                    completion(.failure(decoderError))
//                }
//            }
//        }
//        dataTask.resume()
//    }
//
