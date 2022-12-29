//
//  ProfilePage.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Text("My profile")
                        .font(.system(size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 15){
                        Image("profileView")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom, -30)
                        Text("John Doe")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            Text("Address: \n123 Main St \nAnytown, US \n")
                                .font(.system(size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .background(
                        Color.white.cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    //Custom Navigation link
                    CustomNavigationLink(title: "Edit Profile"){
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
                    }
                    CustomNavigationLink(title: "Shipping Address"){
                        Text("")
                            .navigationTitle("Shipping Address")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
                    }
                    CustomNavigationLink(title: "Order History"){
                        Text("")
                            .navigationTitle("Order History")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
                    }
                    CustomNavigationLink(title: "Cards"){
                        Text("")
                            .navigationTitle("Cards")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
                    }
                    CustomNavigationLink(title: "Notifications"){
                        Text("")
                            .navigationTitle("Notification")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.0, brightness: 0.932)/*@END_MENU_TOKEN@*/)
        }
    }
    
    //Structs can be used to create information for each section. More development time would be needed.
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping ()->Detail) -> some View{
        NavigationLink {
            content()
        } label: {
            HStack{
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.white.cornerRadius(12))
            .padding(.horizontal)
            .padding(.top, 10)
        }

    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
