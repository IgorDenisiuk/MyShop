//
//  MainView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct MainView: View {
    
    let items = Array(1...100).map { "Item \($0)" }
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        ZStack {
            Color("brandColorGray")
                .ignoresSafeArea()
            
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                
                Spacer()
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: layout, alignment: .center, spacing: 20) {
                        ForEach((items).filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                .fill(Color.white)
                                                .frame(width: 170, height: 200)

                                Text(item)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
