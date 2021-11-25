//
//  ItemViewModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 25.11.21.
//

import Foundation
import SwiftUI

class ItemViewModel: Identifiable, ObservableObject {
    
    let id: Int
    let itemName: String
    let itemDetail: String
    
    init(item: ItemModel) {
        self.id = item.id
        self.itemName = item.itemName
        self.itemDetail = item.itemDetail
    }
}
