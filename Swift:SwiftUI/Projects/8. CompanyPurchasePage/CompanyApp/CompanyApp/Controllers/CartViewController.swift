//
//  CartViewController.swift
//  CompanyApp
//
//  Created by M_955328 on 2/24/22.
//

import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var shoppingCart: [ProductModel] = []
    
    @IBOutlet var shoppingCartView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        shoppingCartView.delegate = self
        shoppingCartView.dataSource = self
    }
    
    // MARK: - Making Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentProduct = shoppingCart[indexPath.row]
        let cell = ShoppingCartCell(style: .default, reuseIdentifier: "productCell")
        cell.productTitle.text = currentProduct.title
        cell.productImage.image = UIImage(named: currentProduct.icon!)
        cell.priceLabel.text = currentProduct.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func didTapBuyButton(){
        print("Button clicked")
        let alert = UIAlertController(title: "Buy Successful!", message: "Thank you for your purchase! Your will receive an email when items are shipped.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            
            self.shoppingCart.removeAll()
            self.navigationController?.popToRootViewController(animated: true)
        }))
    }

}
