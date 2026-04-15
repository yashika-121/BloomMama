//
//  SparkleRevealView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import SwiftUI

struct SparkleRevealView: View {
    
    let sparkle: DailySparkle
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            
            Spacer()
            
            Image(systemName: "sparkles")
                .font(.system(size: 50))
                .foregroundStyle(.pink)
            
            VStack(spacing: 16) {
                
                Text("Your Sparkle for Today ✨")
                    .font(.title2.bold())
                
                Text("💖 \(sparkle.affirmation)")
                    .multilineTextAlignment(.center)
                
                Text("🌿 \(sparkle.action)")
                    .multilineTextAlignment(.center)
                
                Text("✨ \(sparkle.permission)")
                    .multilineTextAlignment(.center)
                    
            }
            .padding(.horizontal)
            
            Button {
                dismiss()
            } label: {
                Text("I Received This 💕")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    SparkleRevealView(
        sparkle: DailySparkle(
            affirmation: "You are blooming beautifully.",
            action: "Take a mindful breath and smile.",
            permission: "Give yourself permission to rest today."
        )
    )
}
