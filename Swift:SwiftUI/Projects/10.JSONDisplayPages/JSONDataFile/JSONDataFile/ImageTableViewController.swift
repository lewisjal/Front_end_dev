//
//  ViewController.swift
//  JSONDataFile
//
//  Created by M_955328 on 3/1/22.
//

import UIKit

class ImageTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var apiPhotos = Service()
    private var photos = [PhotosData]()

   @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//MARK: - Fetching JSON
        apiPhotos.getPhotosData{ (photo) in
            photo
            
        }
        
        
//        func fetchPhotoData(completion: ()-> ()){
//
//            apiService.getPhotosData{ (photo) in
//
//                switch photo {
//                case .success(let photos):
//
//                }
//            }
            
       // }
//MARK: - End of  JSON section
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
//        if let cell?.textLabel.text = "Hello" {
//            return cell
//        }
        
    }
}
