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
                
                CustomTextfield(image: "person", title: "FIRST NAME", value: $viewModel.user.firstName, animation: animation)
                    .foregroundColor(Color("brandColor"))
                CustomTextfield(image: "person.2", title: "SECOND NAME", value: $viewModel.user.secondName, animation: animation)
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
                .padding(.top, 120)
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
