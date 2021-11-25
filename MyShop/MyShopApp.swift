//
//  MyShopApp.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

@main
struct MyShopApp: App {
    
    var items = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            AnimationView().environmentObject(items)
        }
    }
}
