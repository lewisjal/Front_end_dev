//
//  LoginViewModel.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/29/22.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    
    //Login properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register properties
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showReEnterPassword: Bool = false
    
    
    @AppStorage("log_Status") var log_Status: Bool = false

    //Login call
    func login(){
        //Do somethings
        withAnimation {
            log_Status = true
        }

    }
    
    func register(){
        //Do somethings
        withAnimation {
            log_Status = true
        }
        
    }
    
    func forgotPassword(){
        // Do somethings
    }
}
