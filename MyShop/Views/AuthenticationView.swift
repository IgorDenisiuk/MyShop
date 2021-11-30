//
//  AuthenticationView.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var viewModel = AccountViewModel()
    
    @Binding var show: Bool
    
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack {
                HStack {
                    Button{show.toggle()} label: {
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
                CustomTextfield(image: "person.2", title: "SECOND NAME", value: $viewModel.user.secondName, animation: animation)
                    .padding(.top, 5)
                CustomTextfield(image: "envelope", title: "EMAIL", value: $viewModel.user.email, animation: animation)
                    .padding(.top, 5)
                CustomTextfield(image: "lock", title: "PASSWORD", value: $viewModel.user.password, animation: animation)
              
                HStack {
                    Spacer()
                    
                    Button{
                        viewModel.saveChages()
                        
                    } label: {
                        HStack(spacing: 10) {
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
                    
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("sign in")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("brandColor"))
                        })
                }
                .padding()
                .padding(.top, 90)
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

