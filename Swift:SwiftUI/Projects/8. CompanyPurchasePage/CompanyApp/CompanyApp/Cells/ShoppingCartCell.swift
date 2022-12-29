//
//  ShoppingCartCell.swift
//  CompanyApp
//
//  Created by M_955328 on 2/25/22.
//

import UIKit
import Foundation

class ShoppingCartCell: UITableViewCell {
    var productTitle: UILabel!
    var productImage: UIImageView!
    var quantityChange: UIButton!
    var priceLabel: UILabel!
//    var state: CurrentState = .notDownloaded
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        productTitle = UILabel(frame: CGRect(x: 100, y: 10, width: 300, height: 40))
        self.addSubview(productTitle)
        
        productImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
        self.addSubview(productImage)
        
        quantityChange = UIButton(frame: CGRect(x: 300, y: 10, width: 80, height: 80))
        self.addSubview(quantityChange)
        
        priceLabel = UILabel(frame: CGRect(x:100, y: 70, width: 300, height: 40))
        self.addSubview(priceLabel)
    }
             required init(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}
