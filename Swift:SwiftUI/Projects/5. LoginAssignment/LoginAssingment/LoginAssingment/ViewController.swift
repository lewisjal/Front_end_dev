//
//  ViewController.swift
//  LoginAssingment
//
//  Created by M_955328 on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    let rememberMeLabel = UILabel()
    let usernameLabel = UIButton()
    let passwordLabel = UIButton()
    let loginButton = UIButton()
    let switchOnOff = UIButton()
    
    let userdefaults = UserDefaults()
    let passworddefaults = UserDefaults()
    
    var rememberMeChecked: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//MARK: - Design
        
        usernameField.frame = CGRect(x: self.view.frame.width / 12, y: self.view.frame.height/3, width: (self.view.frame.width)-55, height: self.view.frame.height/30)
        usernameField.adjustsFontSizeToFitWidth = true
        usernameField.backgroundColor = .white
        usernameField.placeholder = "Email or username"
        usernameField.borderStyle = .roundedRect
        self.view.addSubview(usernameField)
        
        usernameLabel.frame = CGRect(x: usernameField.frame.minX, y: usernameField.frame.minY-35, width: self.view.frame.width / 4.5, height: usernameField.frame.height)
        usernameLabel.setTitle("Username", for: .normal)
        usernameLabel.setTitleColor(.darkGray, for: .normal)
        self.view.addSubview(usernameLabel)
        
        passwordField.frame = CGRect(x: self.view.frame.width / 12, y: (self.view.frame.height/3) + 80, width: (self.view.frame.width)-55, height: self.view.frame.height/30)
        passwordField.adjustsFontSizeToFitWidth = true
        passwordField.backgroundColor = .white
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        self.view.addSubview(passwordField)
        
        passwordLabel.frame = CGRect(x: passwordField.frame.minX, y: passwordField.frame.minY-35, width: self.view.frame.width / 5, height: passwordField.frame.height)
        passwordLabel.setTitle("Password", for: .normal)
        passwordLabel.setTitleColor(.darkGray, for: .normal)
        self.view.addSubview(passwordLabel)
        
        loginButton.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height/3 + 150, width: self.view.frame.width / 2, height: self.view.frame.height / 10)
        loginButton.backgroundColor = .lightGray
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        rememberMeLabel.frame = CGRect(x: CGFloat(Int(passwordField.frame.minX) + 50), y: passwordField.frame.minY + 35, width: self.view.frame.width / 3, height: passwordLabel.frame.height)
        rememberMeLabel.text = "Remember Me"
        rememberMeLabel.textColor = .black
        self.view.addSubview(rememberMeLabel)
        
        switchOnOff.frame = CGRect(x: rememberMeLabel.frame.minX - 50, y: rememberMeLabel.frame.minY, width: rememberMeLabel.frame.width / 3, height: rememberMeLabel.frame.height)
        switchOnOff.addTarget(self, action: #selector(didTapSwitch), for: .touchUpInside)
        switchOnOff.setImage(UIImage(systemName: "square"), for: .normal)
        self.view.addSubview(switchOnOff)
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        passwordField.isSecureTextEntry = true
        
        if let username = userdefaults.value(forKey: "username") as? String {
            usernameField.text = username
        }
        if let password = passworddefaults.value(forKey: "password") as? String {
            passwordField.text = password
        }
        
//        usernameField.text = UserDefaults.standard.value(forKey: "username") as? String
//        passwordField.text = UserDefaults.standard.value(forKey: "password") as? String
//
//
//        UserDefaults.standard.set(usernameField.text, forKey: "username")
//        UserDefaults.standard.set(passwordField.text, forKey: "password")
//        passworddefaults.setValue(passwordField.text, forKey: "password")
//
//        if let userLogin = userdefaults.value(forKey: "username") as? String{
//            usernameField.text = userLogin
//        }
//        if let password = passworddefaults.value(forKey: "password") as? String{
//            passwordField.text = password
//        }
    //}
        
//        func activateUserDefualts(){
//            if let userLogin = userdefaults.value(forKey: "username") as? String{
//                usernameField.text = userLogin
//            }
//            if let password = passworddefaults.value(forKey: "password") as? String{
//                passwordField.text = password
//            }
//        }
//
//        if rememberMeChecked == true{
//            switchOnOff.setImage(UIImage(systemName: "checkmark.squre"), for: .normal)
//        }

    
    }
    
    func textFieldShouldReturn(){
        userdefaults.setValue(usernameField.text, forKey: "username")
        passworddefaults.setValue(passwordField.text, forKey: "password")
        switchOnOff.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
    //MARK: - Button
    
    @objc func didTapSwitch(){
        if rememberMeChecked == false{
            rememberMeChecked = true
            switchOnOff.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            textFieldShouldReturn()
        }
        else{
            rememberMeChecked = false
            switchOnOff.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @objc private func tapButton(){
        if usernameField.text == "User" && passwordField.text == "Password" {
            
            textFieldShouldReturn()
            
            let rootVC = HomePageVC()
            rootVC.title = "Welcome"
            let navVC = UINavigationController(rootViewController: rootVC)
            
            navVC.modalPresentationStyle = .fullScreen

            present(navVC, animated: true)
//            usernameField.text = ""
//            passwordField.text = ""
        }
        else if (usernameField.text != "User" && passwordField.text != "Password"){
            let alert = UIAlertController(title: "Login Failed", message: "Invalid username and password. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                print("cancel")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else if (usernameField.text != "User"){
            let alert = UIAlertController(title: "Login Failed", message: "Invalid username. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                print("cancel")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Login Failed", message: "Invalid password. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                print("cancel")
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}


