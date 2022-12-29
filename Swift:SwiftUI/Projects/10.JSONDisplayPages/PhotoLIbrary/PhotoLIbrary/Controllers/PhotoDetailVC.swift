//
//  PhotoDetailVC.swift
//  PhotoLIbrary
//
//  Created by M_955328 on 3/2/22.
//

import Foundation
import UIKit
import WebKit

class PhotosDetailVC: UIViewController, WKNavigationDelegate {
    
    var photo: PhotoStruct?
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoWebDisplay: WKWebView!
    @IBOutlet weak var WebActivityLoader: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebActivityLoader.startAnimating()
        
        photoTitleLabel.text = photo?.title
        
        guard let url = URL(string: photo?.url ?? "") else {return}
        let request = URLRequest(url: url)
        WebActivityLoader.stopAnimating()
        photoWebDisplay.load(request)
        
        
        
    }
    
    
}
