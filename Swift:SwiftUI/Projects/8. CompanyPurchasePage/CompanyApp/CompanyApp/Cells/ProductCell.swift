//
//  ProductCell.swift
//  CompanyApp
//
//  Created by M_955328 on 2/24/22.
//

import UIKit
import Foundation

class ProductCell: UITableViewCell {
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var iconImageLabel: UIImageView!
    var downloadImageButton: UIButton!
    var priceLabel: UILabel!
//    var state: CurrentState = .notDownloaded
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRect(x: 100, y: 10, width: 300, height: 40))
        self.addSubview(titleLabel)
        
        descriptionLabel = UILabel(frame: CGRect(x: 100, y: 40, width: 300, height: 40))
        self.addSubview(descriptionLabel)
        
        iconImageLabel = UIImageView(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
        self.addSubview(iconImageLabel)
        
        downloadImageButton = UIButton(frame: CGRect(x: 300, y: 10, width: 80, height: 80))
        self.addSubview(downloadImageButton)
        
        priceLabel = UILabel(frame: CGRect(x:100, y: 70, width: 300, height: 40))
        self.addSubview(priceLabel)
    }
             required init(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}
