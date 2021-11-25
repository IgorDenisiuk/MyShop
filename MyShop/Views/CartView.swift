//
//  CartView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var items: CartViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.items) { item in
                    
                }
            }
            .navigationBarTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
