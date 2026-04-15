//
//  FloatingParticlesView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 15/02/26.
//

import SwiftUI

struct FloatingParticlesView: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { _ in
                Circle()
                    .fill(Color.pink.opacity(0.12))
                    .frame(width: CGFloat.random(in: 10...25))
                    .offset(
                        x: CGFloat.random(in: -150...150),
                        y: animate ? -400 : 400
                    )
                    .animation(
                        .linear(duration: Double.random(in: 12...20))
                        .repeatForever(autoreverses: false),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    FloatingParticlesView()
}
