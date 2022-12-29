//
//  ViewController.swift
//  PhotoLIbrary
//
//  Created by M_955328 on 3/2/22.
//

import UIKit

class PhotoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var photosTableView: UITableView!
    @IBOutlet weak var photosSearchBar: UISearchBar!
    
    var photos = [PhotoStruct]()
    var currentPhotoArray = [PhotoStruct]() //creates secodn array to pull from in search bar
    
    
    let thumbService = thumbnailService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPhotosData {
            self.photosTableView.reloadData()
        }
//        setUpSearchBar()
        photosTableView.delegate = self
        photosTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentPhoto = photos[indexPath.row]
        let cell = PhotoCell(style: .default, reuseIdentifier: "photoCell")
        cell.activityIndicator.startAnimating()
        cell.photoTitle.text = currentPhoto.title
        let url = photos[indexPath.row].thumbnailUrl
        guard let url = url else{
            return cell
        }
        cell.activityIndicator.stopAnimating()
        cell.imageViewShow.downloaded(from: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photosTableView.deselectRow(at: indexPath, animated: true)
        
        guard let photoDetailVC = storyboard?.instantiateViewController(withIdentifier: "photos") as? PhotosDetailVC else{
            return
        }
        
        photoDetailVC.photo = photos[indexPath.row]
        navigationController?.pushViewController(photoDetailVC, animated: true)

//        tableView.deselectRow(at: indexPath, animated: true)
//        let currentPhoto = photos[indexPath.row]
//
//        guard let PhotoDetailVC = storyboard?.instantiateViewController(withIdentifier: "photos") as? PhotosDetailVC else{
//            return
//        }
//
//        PhotoDetailVC.photo = photos
//        PhotoDetailVC.completedCart = { updatedShoppingCart in
//
//            self.navigationController?.popToRootViewController(animated: true)
//            self.shoppingArray = updatedShoppingCart
//            self.productList.reloadData()
            
//    }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else {currentPhotoArray = photos
//            photosTableView.reloadData()
//            return}
//        currentPhotoArray = photos.filter({ photo -> Bool in
//            return ((photo.title?.contains(searchText)) != nil)
//        })
//        photosTableView.reloadData()
//    }
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        return
//    }
//    func setUpSearchBar(){
//        photosSearchBar.delegate = self
//
//    }

    
    func getPhotosData(completed: @escaping () -> ()){
        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos"){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else {return}
                if error == nil{
                    do{
                        self.photos = try JSONDecoder().decode([PhotoStruct].self, from: data)
                        
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

