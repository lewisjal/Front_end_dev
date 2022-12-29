//
//  ViewController.swift
//  CompanyApp
//
//  Created by M_955328 on 2/23/22.
//

import UIKit

class ShoppingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var productList: UITableView!
    
    var productArray: [ProductModel] = []
    var shoppingArray: [ProductModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillProductsArray()
        productList.delegate = self
        productList.dataSource = self
    }
    
    func fillProductsArray(){
        let product1 = ProductModel()
        product1.title = "Blue Collard Shirt"
        product1.price = "$10.00"
        product1.description = "Check out our 100% cotton blue collard shirt"
        product1.icon = "bluecollar.jpg"
        let product2 = ProductModel()
        product2.title = "Red Collard Shirt"
        product2.price = "$40.00"
        product2.description = "Check out our 100% cotton red collard shirt"
        product2.icon = "redShirt.jpg"
        let product3 = ProductModel()
        product3.title = "Yellow Sweater"
        product3.price = "$60.00"
        product3.description = "Check out our 100% Poleyester yellow sweater"
        product3.icon = "YellowSweater.jpg"
        let product4 = ProductModel()
        product4.title = "Gray Jacket"
        product4.price = "$15.00"
        product4.description = "Check out our gray jacket built to withstand any weather hot or cold"
        product4.icon = "grayJacket.jpg"
        let product5 = ProductModel()
        product5.title = "Blue Jeans"
        product5.price = "$20.00"
        product5.description = "Check out our 100% Denim blue jeans that are guranteed to stretch and fit and conform to your body"
        product5.icon = "blueJeans.jpg"
        
        
        productArray.append(contentsOf: [product1, product2, product3, product4, product5])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentProduct = productArray[indexPath.row]
        let cell = ProductCell(style: .default, reuseIdentifier: "productCell")
        cell.titleLabel.text  = currentProduct.title
        cell.descriptionLabel.text = currentProduct.description
        cell.iconImageLabel.image = UIImage(named: currentProduct.icon!)
        cell.priceLabel.text = currentProduct.price
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentProduct = productArray[indexPath.row]
        
        guard let productVC = storyboard?.instantiateViewController(withIdentifier: "products") as? ProductViewController else{
            return
        }
        
        productVC.productDetails = currentProduct
        productVC.shoppingCart = shoppingArray
        productVC.completedCart = { updatedShoppingCart in
            
            self.navigationController?.popToRootViewController(animated: true)
            self.shoppingArray = updatedShoppingCart
            self.productList.reloadData()
            
        }
        
//        productVC.cellTitle = productArray[indexPath.row].title!
//        productVC.cellDescription = productArray[indexPath.row].description!
//        productVC.cellImage = UIImage(named: productArray[indexPath.row].icon!)!
//        productVC.cellPrice = productArray[indexPath.row].price!
        
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func didTapShpppingCartButton(_ sender: UIBarButtonItem) {
        guard let shoppingCartVC = storyboard?.instantiateViewController(withIdentifier: "cart") as? CartViewController else{
            return
        }
        print(shoppingArray)
        shoppingCartVC.shoppingCart = shoppingArray
        
        navigationController?.pushViewController(shoppingCartVC, animated: true)
    }
    
}




