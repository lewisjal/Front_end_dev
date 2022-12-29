//
//  ProductViewController.swift
//  CompanyApp
//
//  Created by M_955328 on 2/23/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productPrice: UILabel!
    
//    var delegate: ProductDelegateProtocol? = nil

    var shoppingCart: [ProductModel] = []
    
    var productDetails: ProductModel!
    
    var completedCart: (([ProductModel]) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productTitle.text = productDetails.title
        productImage.image = UIImage(named: productDetails.icon!)
        productDescription.text = productDetails.description
        productPrice.text = productDetails.price
        shoppingCart.append(productDetails)
        
        
//        if let information = productTitle.text{
//            completedField(information, productDescription.text, productImage)
//        }
    }
    
    
    @IBAction func didTapAddToCartButton(){
        completedCart(shoppingCart)
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
