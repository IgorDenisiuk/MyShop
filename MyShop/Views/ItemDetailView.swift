//
//  ItemDetailView.swift
//  MyShop
//
//  Created by wsa-024-23b on 25.11.21.
//

import SwiftUI

struct ItemDetailView: View {
    
    @State var item = ItemViewModel(item: MockData.sampleItem)
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            
            xMarkButton(isShowingDetail: $isShowingDetail)
            
            Spacer()
            
            Text(item.itemName)
                .fontWeight(.semibold)
                .font(.title)
                .padding()
            
            Text(item.itemDetail)
                .font(.title3)
                .foregroundColor(.secondary)
            
            Spacer()
            
            AddButton(item: item, isShowingDetail: $isShowingDetail)
        }
        .frame(width: 350, height: 650)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: ItemViewModel(item: MockData.sampleItem), isShowingDetail: .constant(true))
    }
}
