//
//  AccountImage.swift
//  MyShop
//
//  Created by wsa-024-23b on 26.11.21.
//

import SwiftUI

struct AccountImage: View {
    
    @State var changeAccountImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Button(action: {
                changeAccountImage = true
                openCameraRoll = true
            }, label: {
                if changeAccountImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                }
            })
            
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        }
        .sheet(isPresented: $openCameraRoll) {
            ImagePicker(imageSelected: $imageSelected, sourceType: .photoLibrary)
        }
    }
}

struct AccountImage_Previews: PreviewProvider {
    static var previews: some View {
        AccountImage()
    }
}
