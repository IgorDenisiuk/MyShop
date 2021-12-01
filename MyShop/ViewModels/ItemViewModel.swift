//
//  ItemViewModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 25.11.21.
//

import Foundation
import SwiftUI

class ItemViewModel: Identifiable, ObservableObject {
    
    let itemName: String
    let itemDetail: String
    let itemPrice: Double
    let itemImage: String
    
    init(item: ItemModel) {
        self.itemName = item.itemName
        self.itemDetail = item.itemDetail
        self.itemPrice = item.itemPrice
        self.itemImage = item.itemImage
    }
}
