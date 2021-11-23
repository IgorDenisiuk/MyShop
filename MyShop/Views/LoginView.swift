//
//  LoginView.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var show = false
    @Namespace var animation
    
    var body: some View {
        VStack {
            
            Spacer(minLength: 0)
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Login")
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
            
            CustomTextfield(image: "envelope", title: "EMAIL", value: $email, animation: animation)
            CustomTextfield(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                .padding(.top, 5)
            
            HStack {
                
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 20) {
                    Button{} label: {
                        Text("FORGOT")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("brandColor"))
                    }
                    
                    Button{} label: {
                        HStack(spacing: 10) {
                            Text("LOGIN")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                    }
                }
            }
            .padding()
            .padding(.top, 10)
            .padding(.trailing)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 8) {
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: AuthenticationView(show: $show), isActive: $show) {
                
                        Text("sign up")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("brandColor"))
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
