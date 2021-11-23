//
//  AccountView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: LoginView()) {
                
                Text("Log In")
                    .modifier(CustomButtonModifier())
            }
            .navigationBarTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
