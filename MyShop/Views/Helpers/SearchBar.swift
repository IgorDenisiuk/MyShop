//
//  SearchBar.swift
//  MyShop
//
//  Created by wsa-024-23b on 22.11.21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool

        var body: some View {
            HStack {
                HStack {
                    TextField("Search...", text: $searchText)
                        .padding(.leading, 24)
                }
                .padding(.all, 11)
                .background(Color(.systemGray5))
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture {
                    isSearching = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        Spacer()
                        
                        if isSearching {
                            Button(action: { searchText = "" }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                        }
                    }
                    .padding(.horizontal, 28)
                    .foregroundColor(.gray)
                )
                .transition(.move(edge: .trailing))
                .animation(.spring())
                
                if isSearching {
                    Button(action: {
                        isSearching = false
                        searchText = ""
                        
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                    }, label: {
                        Text("Cancel")
                            .padding(.trailing)
                            .padding(.leading, 0)
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                }
            }
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("12345"), isSearching: .constant(true))
    }
}
