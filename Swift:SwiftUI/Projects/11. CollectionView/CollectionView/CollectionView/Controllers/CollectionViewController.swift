//
//  ViewController.swift
//  CollectionView
//
//  Created by M_955328 on 3/2/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionStruct = [Collection]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self

        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos"){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else {return}
                if error == nil{
                    do{
                        self.collectionStruct = try JSONDecoder().decode([Collection].self, from: data)
                    }
                    catch{
                        print("Parse error")
                    }
                    DispatchQueue.main.async{
                        self.collectionView.reloadData()
                        
                    }
                }
            }.resume()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionStruct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionCell
        cell.collectionTitleLabel.text = collectionStruct[indexPath.row].title
        cell.collectionImageVIew.contentMode = .scaleAspectFit
        let url = collectionStruct[indexPath.row].thumbnailUrl
        guard let url = url else{
            return cell
        }
        cell.collectionImageVIew.downloaded(from: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        guard let collectionDetailVC = storyboard?.instantiateViewController(withIdentifier: "collection") as? CollectionDetailVC else{
            return
        }
        
        collectionDetailVC.collection = collectionStruct[indexPath.row]
        navigationController?.pushViewController(collectionDetailVC, animated: true)

    }
    
    

//func getJSONData(){
//    }
}
