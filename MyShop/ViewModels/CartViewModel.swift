//
//  CartViewModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 24.11.21.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.itemPrice }
    }
}
