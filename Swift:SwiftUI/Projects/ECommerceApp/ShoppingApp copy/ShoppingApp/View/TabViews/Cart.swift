//
//  Cart.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct Cart: View {
    //For designing
    @EnvironmentObject var sharedData: SharedDataModel
    
    //Delete option
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        HStack{
                            Text("Cart")
                                .font(.system(size: 28).bold())
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    showDeleteOption.toggle()
                                }
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red)
                                    .frame(width: 25, height: 25)
                            }
                            .opacity(sharedData.cartProducts.isEmpty ? 0 : 1)
                        }
                        //checking if like product are empty
                        if sharedData.cartProducts.isEmpty{
                            
                            Group{
                                
                                Spacer(minLength: UIScreen.main.bounds.height / 3)
                                
                                Text("There is nothing here.\nYou should add something to your cart.")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(maxHeight: .infinity)
                            }
                        }else{
                            //Dsiplaying products
                            VStack(spacing: 15){
                                
                                //For designing
                                ForEach($sharedData.cartProducts){ $product in
                                    HStack(spacing: 0){
                                        if showDeleteOption{
                                            Button {
                                                deleteProduct(product: product)
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.trailing)

                                        }
                                        CardView(product: $product)
                                    }
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                        
                    }
                    .padding()
                }
                
                //Showing total and checkout button
                if !sharedData.cartProducts.isEmpty{
                    Group{
                        HStack{
                            Text("Total")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(sharedData.getTotal())
                                .font(.system(size: 18).bold())
                                .foregroundColor(.orange)
                        }
                        Button {
                            
                        } label: {
                            Text("Checkout")
                                .font(.system(size: 18).bold())
                                .foregroundColor(.white)
                                .padding(.vertical,18)
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }
                        .padding(.vertical)

                    }
                    .padding(.horizontal, 25)

                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.092, saturation: 0.017, brightness: 0.924)/*@END_MENU_TOKEN@*/.ignoresSafeArea())
        }
    }
    
    func deleteProduct(product: Product){
        if let index = sharedData.cartProducts.firstIndex(where: { currentProduct in
            return product.id == currentProduct.id
        }){
            let _ = withAnimation {
                //removing the products
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
}


struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}

struct CardView: View{
    //Making product binding so it can be updated in real time
    @Binding var product: Product
    
    var body: some View{
        
        HStack(spacing:15){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.system(size: 18).bold())
                    .lineLimit(1)
                Text(product.subtitle)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                
                //Quantity Buttons
                HStack(spacing:10){
                    Text("Quantity")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Button {
                        product.quantity = (product.quantity > 0 ? (product.quantity - 1) : 0)
                    } label: {
                        Image(systemName: "minus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.orange)
                            .cornerRadius(4)
                    }
                    
                    Text("\(product.quantity)")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Button {
                        product.quantity += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.orange)
                            .cornerRadius(4)
                    }

                }
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white.cornerRadius(10)
        )
    }
}
