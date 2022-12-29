//
//  ViewController.swift
//  Gallery App
//
//  Created by M_955328 on 3/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StoriesTableViewCellDelegate {
    @IBOutlet weak var tableScrollView: UIScrollView!
    
    
    
    @IBOutlet weak var recentPhotoTableView: UITableView!
    @IBOutlet weak var suggestPhotoTableView: UITableView!
    @IBOutlet weak var storiesPhotoTableView: UITableView!
    
    var model = [Model]()
    var photos: [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        model.append(Model(text: "Mountain Trip", imagaeName: "landscape_mountains_sun_"))
        model.append(Model(text: "Train", imagaeName: "Nature-Train"))
        model.append(Model(text: "Nature Trip", imagaeName: "Nature"))
        model.append(Model(text: "Paris", imagaeName: "Paris"))
        view.backgroundColor = .systemCyan

        recentPhotoTableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        recentPhotoTableView.delegate = self
        recentPhotoTableView.dataSource = self
        
        suggestPhotoTableView.register(SuggestedPhotoCollectionTableViewCell.nib(), forCellReuseIdentifier: SuggestedPhotoCollectionTableViewCell.identifier)
        suggestPhotoTableView.delegate = self
        suggestPhotoTableView.dataSource = self
        
        storiesPhotoTableView.register(StoriesTableViewCell.nib(), forCellReuseIdentifier: StoriesTableViewCell.identifier)
        storiesPhotoTableView.delegate = self
        storiesPhotoTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case recentPhotoTableView:
            return 1
        case suggestPhotoTableView:
            return 1
        case storiesPhotoTableView:
            return 1
        default:
            print("Did not load rows")
        }
        return 0
    }
    
    func didClick(cell: StoriesTableViewCell) {
        if let index = storiesPhotoTableView.indexPath(for: cell){
            let object = model[index.row]
            performSegue(withIdentifier: "storyDetailSegue", sender: object)
        }
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
        case storiesPhotoTableView:
            if let cellStories = storiesPhotoTableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.identifier, for: indexPath) as? StoriesTableViewCell{
                cellStories.configure(with: model)
                cellStories.delegate = self
                return cellStories
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
        case storiesPhotoTableView:
            return 200
        default:
            print("Could not create height")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recentPhotoTableView.deselectRow(at: indexPath, animated: true)
        suggestPhotoTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == recentPhotoTableView {
            self.recentPhotoTableView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
            self.suggestPhotoTableView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
        else if scrollView == self.suggestPhotoTableView!{
            self.recentPhotoTableView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
    }
}

