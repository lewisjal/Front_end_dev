//
//  OnBoardingPage.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/29/22.
//

import SwiftUI

struct OnBoardingPage: View {
    
    // Showing login page
    @State var showLoginPage: Bool = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("Find your \ndevice")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white).font(.system(size: 65))
                    
                Image("shoppingLogo").resizable(capInsets: EdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0)).aspectRatio(contentMode: .fit)
                Button{
                    withAnimation {
                        showLoginPage = true
                    }
                }label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .background(Color.blue)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                }
                .padding(.horizontal, 35)
                .offset(y: 40)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.background(  Image("vibrant").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
            .overlay(
                Group{
                    if showLoginPage{
                        Login().transition(.move(edge: .bottom))
                    }
                }
            )
        
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage().previewDevice("iPhone 13")
        
        OnBoardingPage().previewDevice("iPhone 8")
    }
}
