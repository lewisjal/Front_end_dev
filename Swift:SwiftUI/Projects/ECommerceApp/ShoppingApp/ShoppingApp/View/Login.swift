//
//  Login.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/29/22.
//

import SwiftUI

struct Login: View {
    
    @StateObject var loginData: LoginViewModel = LoginViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Welcome.")
                        .font(.system(size: 55))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .bold()
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity, alignment: .leading)
                        .frame(height: UIScreen.main.bounds.height / 3.5).padding()

            ScrollView(.vertical, showsIndicators: false){
                //Login form
                VStack(spacing: 15){
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.system(size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //display custom text field
                    customTextField(icon: "envelope", title: "Email", hint: "yourname@shopping.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    customTextField(icon: "lock", title: "Password", hint: "password", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    //Show if user is not registered
                    if loginData.registerUser{
                        customTextField(icon: "lock", title: "Re-Enter Password", hint: "password", value: $loginData.reEnterPassword, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    //Login button
                    Button{
                        if loginData.registerUser{
                            loginData.register()
                        }else{
                            loginData.login()
                        }
                    }label: {
                        Text("Login")
                            .font(.system(size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.8), radius: 5, x: 5, y: 5)

                    }.padding(.top, 25)
                        .padding(.horizontal)
                    Button {
                        withAnimation {
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to Login" : "Create an account")
                            .font(.system(size: 14))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                }
                .padding(30)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(  Image("vibrant").resizable().aspectRatio(contentMode: .fill)).ignoresSafeArea()
    }
    
    @ViewBuilder
    func customTextField(icon: String, title: String, hint: String, value:Binding<String>, showPassword:Binding<Bool>) -> some View{
        VStack(alignment: .leading, spacing: 12){
            Label {
                Text(title)
                    .font(.subheadline)
            }icon:{
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            if title.contains("Password"){
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            Divider()
                .background(Color.black.opacity(0.4))
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().previewDevice("iPhone 13")
        Login().previewDevice("iPhone 8")
    }
}
