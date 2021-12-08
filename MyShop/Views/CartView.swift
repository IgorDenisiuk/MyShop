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
                    AddToShopButton()
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
