//
//  AccountView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName  = ""
    @State private var lastName   = ""
    @State private var email      = ""
    @State private var birthdate  = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                AccountImage()
                
                Form {
                    Section(header: Text ("Personal Info")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    }
                }
                
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .modifier(CustomButtonModifier())
                }
                Spacer()
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
