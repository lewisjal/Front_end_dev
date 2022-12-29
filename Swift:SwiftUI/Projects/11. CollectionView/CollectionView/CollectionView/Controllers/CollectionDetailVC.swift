//
//  CollectionDetailVC.swift
//  CollectionView
//
//  Created by M_955328 on 3/3/22.
//

import Foundation
import UIKit
import WebKit
class CollectionDetailVC: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var detailActivityIndicator: UIActivityIndicatorView!
    
    var collection: Collection?
    

    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var collectionWebDisplay: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailActivityIndicator.isHidden = false
        collectionTitle.text = collection?.title
        
        guard let url = URL(string: collection?.url ?? "") else {
            detailActivityIndicator.startAnimating()
            return
        }
        let request = URLRequest(url: url)
        collectionWebDisplay.load(request)
        detailActivityIndicator.stopAnimating()
        detailActivityIndicator.isHidden = true

        
        
        
    }
    
    
}
