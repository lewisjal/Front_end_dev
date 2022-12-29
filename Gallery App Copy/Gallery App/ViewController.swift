//
//  ViewController.swift
//  Gallery App
//
//  Created by M_955328 on 3/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var recentPhotoTableView: UITableView!
    @IBOutlet weak var suggestPhotoTableView: UITableView!
    
    var model = [Model]()
    var photos: [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.append(Model(text: "First", imagaeName: "landscape_mountains_sun_"))
        model.append(Model(text: "Second", imagaeName: "Nature-Train"))
        model.append(Model(text: "Third", imagaeName: "Nature"))
        model.append(Model(text: "Fourth", imagaeName: "Paris"))
        view.backgroundColor = .systemCyan

        recentPhotoTableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        recentPhotoTableView.delegate = self
        recentPhotoTableView.dataSource = self
        
        suggestPhotoTableView.register(SuggestedPhotoCollectionTableViewCell.nib(), forCellReuseIdentifier: SuggestedPhotoCollectionTableViewCell.identifier)
        suggestPhotoTableView.delegate = self
        suggestPhotoTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case recentPhotoTableView:
            return 1
        case suggestPhotoTableView:
            return 1
        default:
            print("Did not load rows")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView{
        case recentPhotoTableView:
            if let cell = recentPhotoTableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell {
                cell.configure(with: model)
                return cell
            }
        case suggestPhotoTableView:
            if let cellSuggested = suggestPhotoTableView.dequeueReusableCell(withIdentifier: SuggestedPhotoCollectionTableViewCell.identifier, for: indexPath) as? SuggestedPhotoCollectionTableViewCell{
                cellSuggested.configure(with: model)
                cellSuggested.model.append(Model(text: "New Image", imagaeName: "car"))
                return cellSuggested
            }
        default:
            print("Could not load table")
        }
        return CollectionTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView{
        case recentPhotoTableView:
            return 250
        case suggestPhotoTableView:
            return 300
        default:
            print("Could not create height")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recentPhotoTableView.deselectRow(at: indexPath, animated: true)
        suggestPhotoTableView.deselectRow(at: indexPath, animated: true)
    }
    


}

