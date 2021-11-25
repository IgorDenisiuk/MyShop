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
            List {
                ForEach(cart.items) { item in
                    ItemCell(item: item)
                }
                .onDelete(perform: delete)
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
