//
//  AddButton.swift
//  MyShop
//
//  Created by wsa-024-23b on 25.11.21.
//

import SwiftUI

struct AddButton: View {
    
    @EnvironmentObject var cartItem: CartViewModel
    @State var item: ItemViewModel
    @Binding var isShowingDetail: Bool
    @State var buttonTitle: String
    
    var body: some View {
        Button {
            cartItem.items.append(item)
            isShowingDetail = false
        } label: {
            Text(buttonTitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("brandColor"))
                .cornerRadius(12)
        }
        .padding()
        .padding(.vertical, 5)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(item: ItemViewModel(item: MockData.sampleItem), isShowingDetail: .constant(false), buttonTitle: "Add Item to Cart")
    }
}
