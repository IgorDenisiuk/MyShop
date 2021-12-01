//
//  LoginView.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = AccountViewModel()
    @State private var showingAuth = false
    @Binding var showingLogin: Bool
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                Button{showingLogin.toggle()} label: {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .padding(.leading)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Log in")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.primary)
                    
                    Text("Please sign in to continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading)
            
            CustomTextfield(image: "envelope", title: "EMAIL", value: $viewModel.user.email, animation: animation)
                .autocapitalization(.none)
                .foregroundColor(Color("brandColor"))
            CustomTextfield(image: "lock", title: "PASSWORD", value: $viewModel.user.password, animation: animation)
                .foregroundColor(Color("brandColor"))
                .padding(.top, 5)
            
            HStack {
                
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 20) {
                    Button {
                        showingLogin.toggle()
                    } label: {
                        HStack(spacing: 10) {
                            Text("LOG IN")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                    }
                }
            }
            .padding()
        }
        .padding(.top, 10)
        
        Spacer(minLength: 0)
        
        HStack(spacing: 8) {
            Text("Don't have an account?")
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            
            Button{
                self.showingAuth.toggle()
            } label: {
                HStack(spacing: 10) {
                    Text("sign up")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("brandColor"))
                }
                .sheet(isPresented: $showingAuth) {
                    AuthenticationView(showingAuth: $showingAuth, showingLogin: $showingLogin)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.retrieveUser()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showingLogin: .constant(false))
    }
}
