//
//  PhotoCell.swift
//  PhotoLIbrary
//
//  Created by M_955328 on 3/2/22.
//

import UIKit
import Foundation
import WebKit

class PhotoCell: UITableViewCell {
    var photoTitle: UILabel!
    var imageViewShow: UIImageView!
    var activityIndicator: UIActivityIndicatorView!
    
    var photo: PhotoStruct?
//    var state: CurrentState = .notDownloaded
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        photoTitle = UILabel(frame: CGRect(x: 120, y: 10, width: 300, height: 40))
        self.addSubview(photoTitle)
        
        imageViewShow = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        self.addSubview(imageViewShow)
        
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x:10, y:10, width: 10, height:10))
        self.addSubview(activityIndicator)
    }
             required init(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }

}
