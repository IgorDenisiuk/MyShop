//
//  CartView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(cart.items, id: \.self) { item in
                            ItemCell(item: item)
                        }
                        .onDelete(perform: delete)
                    }
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("$\(cart.totalPrice, specifier: "%.2f") - Заказать")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color("brandColor"))
                            .cornerRadius(12)
                    }
                    .padding()
                }
                if cart.items.isEmpty {
                    EmptyState(imageName: "emptyOrder", message: "You have no items in your cart. Please add some items.")
                }
            }
            .navigationBarTitle("Cart")
        }
    }
    
    func delete(indexSet: IndexSet) {
        cart.items.remove(atOffsets: indexSet)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
