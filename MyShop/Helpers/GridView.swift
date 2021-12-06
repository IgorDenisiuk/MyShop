//
//  GridView.swift
//  MyShop
//
//  Created by wsa-024-23b on 1.12.21.
//

import SwiftUI

struct GridView: View {
    
    let item: ItemModel
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {
                Image(item.itemImage)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.primary)
                
                HStack {
                    Text(item.itemName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    Spacer()
                    
                    Text("\(item.itemPrice, specifier: "%.2f")$ ")
                }
                .padding(.leading, 10)
                .padding(.trailing, 15)
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }
        .frame(width: 170, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(item: MockData.sampleItem)
    }
}
