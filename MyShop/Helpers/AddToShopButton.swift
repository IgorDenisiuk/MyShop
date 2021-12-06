//
//  AddToShopButton.swift
//  MyShop
//
//  Created by wsa-024-23b on 2.12.21.
//

import SwiftUI

struct AddToShopButton: View {
    
    @EnvironmentObject var cart: CartViewModel
    @State private var showingAlert = false
    
    var body: some View {
        Button {
            showingAlert.toggle()
        } label: {
            Text("$\(cart.totalPrice, specifier: "%.2f") - Заказать")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("brandColor"))
                .cornerRadius(12)
        }
        .padding()
        .padding(.bottom, 5)
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text(""), message: Text("Ваш заказ на сумму \(cart.totalPrice, specifier: "%.2f")$ отправлен в магазин"), dismissButton: .default(Text("OK")))
        })
    }
}

struct AddToShopButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToShopButton()
    }
}
