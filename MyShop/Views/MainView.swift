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
        GridItem(.flexible()),
    ]
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var isShowingDetail = false
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText, isSearching: $isSearching)
            
            Spacer()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: layout, alignment: .center, spacing: 20) {
                    ForEach((items).filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.gray)
                                .frame(width: 170, height: 200)
                            
                            Text(item)
                        }
                        .onTapGesture {
                            isShowingDetail = true
                        }
                    }
                }
            }
        }
        .blur(radius: isShowingDetail ? 20 : 0)
        
        if isShowingDetail {
           
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
