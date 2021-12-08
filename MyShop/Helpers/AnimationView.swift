//
//  AnimationView.swift
//  MyShop
//
//  Created by wsa-024-23b on 19.11.21.
//

import SwiftUI

struct AnimationView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            
            RootView()
            
            ZStack {
                Color("brandColor")
                
                Image("shopBig")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    .scaleEffect(animate ? 3 :1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

