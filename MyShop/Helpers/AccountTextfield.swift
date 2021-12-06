//
//  AccountTextfield.swift
//  MyShop
//
//  Created by wsa-024-23b on 6.12.21.
//

import SwiftUI

struct AccountTextfield: View {
    
    var iconName: String
    var textfieldName: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(Color("brandColor"))
            TextField(textfieldName, text: $value)
        }
    }
}

struct AccountTextfield_Previews: PreviewProvider {
    static var previews: some View {
        AccountTextfield(iconName: "person", textfieldName: "First Name", value: .constant("Test"))
    }
}
