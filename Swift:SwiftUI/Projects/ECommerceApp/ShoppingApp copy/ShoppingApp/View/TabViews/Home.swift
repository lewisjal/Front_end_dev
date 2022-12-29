//
//  Home.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/30/22.
//

import SwiftUI

struct Home: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                //Search bar
                ZStack{
                    if homeData.searchActivated{
                        SearchBar()
                    }else{
                        SearchBar().matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                      
                }
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .padding(.horizontal,25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeData.searchActivated = true
                    }
                }
                Text("Order Online \nCollect in Store")
                    .font(.system(size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                //Product tab
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases, id: \.self){ type in
                            //Here for reusability
                            ProductTypeView(type: type)
                            
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 25)
                //Products page
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25){
                        ForEach(homeData.filteredProducts) { product in
                            //Product card view
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.101, saturation: 0.0, brightness: 0.923)/*@END_MENU_TOKEN@*/)
        //Updating product screen based on change of category
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
        .overlay(
            ZStack{
                if homeData.searchActivated{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }
    
    @ViewBuilder
    func SearchBar() -> some View{
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            //WIll need to create a seperate view for search bar
            TextField("Search", text: .constant("")).foregroundColor(.gray)
        }
        .padding(.vertical,12)
        .padding(.horizontal)
        .background(
            Capsule().strokeBorder(Color.gray, lineWidth: 0.8)
        )
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        VStack(spacing: 10){
            //Adding matched geometry
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }else{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
            Text(product.title)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            Text(product.subtitle)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text(product.price)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.top,5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 25)
        .background(
            Color.white.cornerRadius(15)
        )
        //Showing product detail when tapped
        .onTapGesture {
            print("You got tapped")
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }

    }
    
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View{
        Button {
            //Updating current type...
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.system(size: 15))
                .fontWeight(.semibold)
            //Changing the foreground color of the button based on current product type
                .foregroundColor(homeData.productType == type ? Color.orange: Color.gray)
                .padding(.bottom, 10)
            // For activity indicator at bottom of category name
                .overlay(
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color.orange)
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal, -5)
                    ,alignment: .bottom
                )
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
