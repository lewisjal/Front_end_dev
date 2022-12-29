//
//  HomePage.swift
//  LoginAssingment
//
//  Created by M_955328 on 2/16/22.
//

import UIKit
import Foundation

class HomePageVC: UIViewController{
    
    var logoutButton = UIButton()
    var hello = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        beach.frame = self.view.frame
//        beach.contentMode = .scaleAspectFill
//        beach.image = UIImage(named: "beach")
//        self.view.addSubview(beach)
        
        hello.frame = CGRect(x: self.view.frame.width/2.25, y: self.view.frame.height/3, width: self.view.frame.width / 6, height: 200)
        hello.text = "Hello"
        self.view.addSubview(hello)
        
        logoutButton.frame = CGRect(x: hello.frame.minX-10, y: hello.frame.maxY + 200, width: (hello.frame.width / 6) + 50, height: hello.frame.height)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.red, for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        self.view.addSubview(logoutButton)
                
    }
    
    @objc func logoutPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}
