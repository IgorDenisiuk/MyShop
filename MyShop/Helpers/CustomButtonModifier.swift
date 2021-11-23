//
//  CustomButtonModifier.swift
//  MyShop
//
//  Created by wsa-024-23b on 23.11.21.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.white)
            .padding(.vertical)
            .padding(.horizontal, 35)
            .background(LinearGradient(
                gradient: .init(colors: [Color("brandColorLight"), Color("brandColor")]),
                startPoint: .leading,
                            endPoint: .trailing)
            )
            .clipShape(Capsule())
    }
}

