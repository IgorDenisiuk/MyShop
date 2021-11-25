//
//  CartViewModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 24.11.21.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject, Identifiable {
    @Published var items: [ItemViewModel] = []
}
