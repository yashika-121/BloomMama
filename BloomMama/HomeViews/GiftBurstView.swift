//
//  GiftBurstView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//


import SwiftUI

struct GiftBurstView: View {
    
    @State private var animate = false
    let items = Array(0..<40)
    let symbols = ["sparkles", "heart.fill", "gift.fill"]
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                ForEach(items, id: \.self) { index in
                    Image(systemName: symbols.randomElement()!)
                        .font(.system(size: CGFloat.random(in: 16...28)))
                        .foregroundStyle(.pink)
                        .position(
                            x: geo.size.width / 2,
                            y: geo.size.height / 2
                        )
                        .offset(
                            x: animate ? CGFloat.random(in: -geo.size.width/2...geo.size.width/2) : 0,
                            y: animate ? CGFloat.random(in: -geo.size.height/2...(-50)) : 0
                        )
                        .opacity(animate ? 0 : 1)
                        .animation(
                            .easeOut(duration: 1)
                            .delay(Double(index) * 0.02),
                            value: animate
                        )
                }
            }
            .ignoresSafeArea()
            .onAppear {
                animate = true
            }
        }
    }
}



#Preview {
    GiftBurstView()
}
