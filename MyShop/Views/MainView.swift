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
    @State private var selectedItem: ItemModel?
    @State private var isLoading = false
    
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
                                        selectedItem = item
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
                ItemDetailView(item: selectedItem!, isShowingDetail: $isShowingDetail)
            }
        
            if isLoading {
                LoadingView()
            }
        }
        .onAppear {
            fakeNetworkCall()
        }
    }
    
    func fakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
