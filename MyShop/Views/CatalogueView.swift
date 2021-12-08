//
//  CatalogueView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct CatalogueView: View {
    
    var catalogue = CatalogueModel()
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                
                Spacer()
                
                List {
                    ForEach ((catalogue.catalogue).filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { item in
                        Text(item)
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Catalogue")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
