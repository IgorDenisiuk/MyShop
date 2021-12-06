//
//  AccountView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var viewModel = AccountViewModel()
    @State private var showingLogin = false
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                AccountImage()
                
                Form {
                    Section(header: Text ("Personal Info")) {
                        AccountTextfield(iconName: "person", textfieldName: "Full Name", value: $viewModel.user.fullName)
                        AccountTextfield(iconName: "envelope", textfieldName: "Email", value: $viewModel.user.email)
                        AccountTextfield(iconName: "calendar", textfieldName: "Birthday", value: $viewModel.user.birthdate)
                        
                        Button {
                            viewModel.saveChages()
                            showingAlert.toggle()
                        } label: {
                            Text("Сохранить изменения")
                                .foregroundColor(Color("brandColor"))
                        }
                        .alert(isPresented: $showingAlert, content: {
                            Alert(title: Text(""), message: Text("Ваши изменения сохранены"), dismissButton: .default(Text("OK")))
                        })
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
