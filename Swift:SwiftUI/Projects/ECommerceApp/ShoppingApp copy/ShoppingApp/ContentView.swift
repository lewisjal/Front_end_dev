//
//  ContentView.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    //When user logs in
    
    @AppStorage("log_Status") var log_Status: Bool = false
    
    var body: some View {
        Group{
            if log_Status{
                ProductPage()
            } else {
                OnBoardingPage()
            }
        }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
