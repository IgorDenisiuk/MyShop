//
//  AuthenticationView.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct AuthenticationView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var number = ""
    
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
                
                CustomTextfield(image: "person", title: "FULL NAME", value: $name, animation: animation)
                CustomTextfield(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                    .padding(.top, 5)
                CustomTextfield(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                    .padding(.top, 5)
                CustomTextfield(image: "phone.fill", title: "PHONE NUMBER", value: $number, animation: animation)
                    .padding(.top, 5)
                
                HStack {
                    Spacer()
                    
                    Button{} label: {
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
                    
                    Button{} label: {
                        Text("sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("brandColor"))
                    }
                }
                .padding()
                .padding(.top, 10)
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

