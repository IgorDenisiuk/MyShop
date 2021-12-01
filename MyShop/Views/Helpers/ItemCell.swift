//
//  ItemCell.swift
//  MyShop
//
//  Created by wsa-024-23b on 25.11.21.
//

import SwiftUI

struct ItemCell: View {
    @ObservedObject var item: ItemViewModel
    
    var body: some View {
        HStack {
            Image(item.itemImage)
                .resizable()
                .frame(width: 50, height: 50)
                .shadow(radius: 5)
                .cornerRadius(5)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(item.itemName)
                Text(item.itemDetail)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(item.itemPrice, specifier: "%.2f") $")
                .font(.caption)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
        .padding()
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(item: ItemViewModel(item: MockData.sampleItem))
    }
}
