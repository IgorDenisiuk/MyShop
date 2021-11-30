//
//  AccountView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var viewModel = AccountViewModel()
    @State private var birthdate  = Date()
    @State private var showingLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                AccountImage()
                
                Form {
                    Section(header: Text ("Personal Info")) {
                        TextField("First Name", text: $viewModel.user.firstName)
                        TextField("Last Name", text: $viewModel.user.secondName)
                        TextField("email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    }
                }
                
                Button{
                    self.showingLogin.toggle()
                } label: {
                    HStack(spacing: 10) {
                        Text("LOG IN")
                            .fontWeight(.heavy)
                        
                        Image(systemName: "arrow.right")
                            .font(.title2)
                    }
                    .modifier(CustomButtonModifier())
                    .sheet(isPresented: $showingLogin) {
                        LoginView(showingLogin: $showingLogin)
                    }
                }
                
                Spacer()
                
            }
            .navigationBarTitle("Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
