//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct ProductDetailView: View {

    
    var product: Product
    
    //For matched geometry effect
    var animation: Namespace.ID
    
    //Shared Data model
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        VStack{
            
            //Making the title bar and the product image
            VStack{
                //Title bar
                HStack{
                    Button {
                        //Closing the view
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }

                    Spacer()
                    
                    Button {
                        addToLiked()
                    } label: {
                        Image("Liked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(isLiked() ? .red :  Color.black.opacity(0.7))
                    }

                }
                .padding()
                
                //Product Image
                //Addign matched geometry effect
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: UIScreen.main.bounds.height / 2.7)
            .zIndex(1)
            
            //product details
            ScrollView(.vertical, showsIndicators: false) {
                // Product Data
                VStack(alignment: .leading, spacing: 15){
                    Text(product.title)
                        .font(.system(size: 20).bold())
                    Text(product.subtitle)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    Text("Get $25 gift card with purchase of 5 or more")
                        .font(.system(size: 18).bold())
                        .padding(.top)
                    Text("Only on valid purchases. Must be 18 or older to receive gift card. A seperate email will be sent on qualifying purchases for additional information.")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Button{
                    
                    }label:{
                        Label {
                            Image(systemName: "arrow.right")
                        } icon: {
                            Text("Full Description")
                        }
                    }
                    HStack{
                        Text("Total")
                            .font(.system(size: 17))
                        
                        Spacer()
                        
                        Text("\(product.price)")
                            .font(.system(size: 20).bold())
                            .foregroundColor(Color.orange)
                    }
                    .padding(.vertical, 20)
                    
                    // Now needing to add a button
                    Button {
                        addToCart()
                    } label: {
                        Text("\(isAddedToCart() ? "added": "add") to cart")
                            .font(.system(size: 20).bold())
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color.orange
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }

                }
                .padding([.horizontal, .bottom], 25)
                .padding(.top,25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color.white
                //Corner radius for only top
            )
            .cornerRadius(/*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            .zIndex(0)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.09, saturation: 0.011, brightness: 0.933)/*@END_MENU_TOKEN@*/.ignoresSafeArea())
    }
    
    func isLiked() -> Bool{
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func isAddedToCart() -> Bool{
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func addToLiked(){
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            //Remove from like
            sharedData.likedProducts.remove(at: index)
        }else{
            //Add to like
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart(){
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            //Remove from like
            sharedData.cartProducts.remove(at: index)
        }else{
            //Add to like
            sharedData.cartProducts.append(product)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        ProductDetailView(product: HomeViewModel().products[0])
//            .environmentObject(SharedDataModel())
        ProductPage()
    }
}
