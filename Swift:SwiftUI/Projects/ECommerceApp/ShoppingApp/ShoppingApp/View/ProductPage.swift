//
//  ProductPage.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/30/22.
//

import SwiftUI

struct ProductPage: View {
    //Observing Current Tab
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    @Namespace var animation
    
    //To hide the tab bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        //Creating tab view
        VStack(spacing: 0){
            TabView(selection: $currentTab) {
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                ProfilePage()
                    .tag(Tab.Profile)
                Cart()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            //Customization of the tab bar
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){ tab in
                    Button {
                        //Updating the observed tab
                        currentTab = tab
                        
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 40)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color.orange : Color.black.opacity(0.3) )
                        
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.101, saturation: 0.0, brightness: 0.923)/*@END_MENU_TOKEN@*/)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.101, saturation: 0.0, brightness: 0.923)/*@END_MENU_TOKEN@*/)
        .overlay(
            ZStack{
                if let product = sharedData.detailProduct, sharedData.showDetailProduct{
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                    //Adding transition
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
       ProductPage()
    }
}


//Tab cases
//Making to be Case Iterable
enum Tab: String, CaseIterable {
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
