//
//  AuthenticationView.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct AuthenticationView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @Binding var showingAuth: Bool
    @Binding var showingLogin: Bool
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack {
                HStack {
                    Button{showingAuth.toggle()} label: {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                }
                .padding()
                .padding(.leading)
                
                HStack {
                    Text("Create Account")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding()
                .padding(.leading)
                
                CustomTextfield(image: "person", title: "FULL NAME", value: $viewModel.user.fullName, animation: animation)
                    .foregroundColor(Color("brandColor"))
                CustomTextfield(image: "calendar", title: "BIRTH DATE", value: $viewModel.user.birthdate, animation: animation)
                    .foregroundColor(Color("brandColor"))
                    .padding(.top, 5)
                CustomTextfield(image: "envelope", title: "EMAIL", value: $viewModel.user.email, animation: animation)
                    .foregroundColor(Color("brandColor"))
                    .padding(.top, 5)
                    .autocapitalization(.none)
                CustomTextfield(image: "lock", title: "PASSWORD", value: $viewModel.user.password, animation: animation)
                    .foregroundColor(Color("brandColor"))
                
                HStack {
                    Spacer()
                    
                    Button{
                        viewModel.saveChages()
                        showingAuth.toggle()
                        showingLogin.toggle()
                    } label: {
                        HStack() {
                            Text("SIGN UP")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                    }
                }
                .padding()
                .padding(.top)
                .padding(.trailing)
                
                Spacer(minLength: 70)
                
                HStack {
                    Text("Already have an account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Button {
                        showingAuth.toggle()
                    } label: {
                        Text("sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("brandColor"))
                    }
                }
                .padding()
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(showingAuth: .constant(false), showingLogin: .constant(false))
    }
}
