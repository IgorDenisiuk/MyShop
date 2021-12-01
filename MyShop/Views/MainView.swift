//
//  MainView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct MainView: View {
    
    let items = Item()
    
    let layout = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var isShowingDetail = false
    @State private var selectedItem = ItemViewModel(item: MockData.sampleItem)
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 10) {
                            ForEach((items.items).filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                                GridView(item: item)
                                    .onTapGesture {
                                        isShowingDetail = true
                                    }
                            }
                        }
                    }
                }
                .disabled(isShowingDetail)
                .navigationBarTitle("My Shop")
                .navigationBarTitleDisplayMode(.inline)
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                ItemDetailView(item: selectedItem, isShowingDetail: $isShowingDetail)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
