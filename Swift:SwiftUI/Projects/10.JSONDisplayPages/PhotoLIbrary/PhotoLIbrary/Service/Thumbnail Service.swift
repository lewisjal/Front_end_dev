//
//  Thumbnail Service.swift
//  PhotoLIbrary
//
//  Created by M_955328 on 3/3/22.
//

import Foundation

class thumbnailService {
    
    // helps in getting things from the server
    let task = URLSession.shared
    

    func getDataFromServer(urlString : String, completion: @escaping (Data) -> ()) {
        
        // if url exist, use URL to check
        if let url = URL(string: urlString) {
            
//MARK: - on a side Thread
            
            // send a request
            let dataTask = task.dataTask(with: URLRequest(url: url)) { data, response, error in
                // if errer
                if error != nil {
                    print("print some error")
                }
                // data was returned
                else {
                    
                    // grab usable data
                    if let usableData = data {
                        completion(usableData)
//                        completion(data ?? Data())
                    }
                }
            }
            
//MARK: - end of side Thread
            
            // get data from the service
            dataTask.resume()
        }
        
    }
}
