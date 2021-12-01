//
//  ItemModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 24.11.21.
//

import Foundation
import SwiftUI

struct ItemModel: Hashable {
    let id = UUID()
    let itemName: String
    let itemDetail: String
    let itemPrice: Double
    let itemImage: String
}

struct MockData {
    
    static let sampleItem = ItemModel(itemName: "Adidas",
                                      itemDetail: "Original",
                                      itemPrice: 49.99,
                                      itemImage: "adidasSuperStar")
}

struct Item {
    
    let items = [     ItemModel(itemName: "Adidas", itemDetail: "SuperStar", itemPrice: 39.99, itemImage: "adidasSuperStar"),
                      ItemModel(itemName: "Nike", itemDetail: "Boost", itemPrice: 49.99, itemImage: "nikeBlack"),
                      ItemModel(itemName: "Adidas", itemDetail: "EQT", itemPrice: 69.99, itemImage: "adidasEqt"),
                      ItemModel(itemName: "Nike", itemDetail: "AirMax", itemPrice: 79.99, itemImage: "nikeAir"),
                      ItemModel(itemName: "Nike", itemDetail: "Air", itemPrice: 89.99, itemImage: "nike"),
                      ItemModel(itemName: "Adidas",  itemDetail: "EQT",  itemPrice: 79.99, itemImage: "adidas1"),
                      ItemModel(itemName: "Adidas", itemDetail: "EQT", itemPrice: 69.99, itemImage: "adidasSuperStar"),
                      ItemModel(itemName: "Adidas",  itemDetail: "EQT",  itemPrice: 79.99, itemImage: "adidas2"),
                      ItemModel(itemName: "Adidas", itemDetail: "EQT", itemPrice: 69.99, itemImage: "adidasEqt"),
                      ItemModel(itemName: "Nike", itemDetail: "AirMax", itemPrice: 79.99, itemImage: "nikeAir"),
                      ItemModel(itemName: "Nike", itemDetail: "Air", itemPrice: 89.99, itemImage: "nike")
    ]
}
