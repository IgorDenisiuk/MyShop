//
//  ItemModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 24.11.21.
//

import Foundation
import SwiftUI

struct ItemModel {
    let id: Int
    let itemName: String
    let itemDetail: String
}

struct MockData {
    
    static let sampleItem = ItemModel(id: 001,
                                      itemName: "Item",
                                      itemDetail: "Detail")
    
    static let items = [sampleItem, sampleItem, sampleItem, sampleItem, sampleItem, sampleItem, sampleItem, sampleItem, sampleItem, sampleItem]
}
