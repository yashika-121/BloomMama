//
//  DailySparkleCard.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//


import SwiftUI

struct DailySparkleCard: View {
    
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.pink.opacity(0.08))
            .overlay(
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Your Daily Sparkle")
                            .font(.title3.bold())
                        
                        Text("Tap to reveal your 5-minute wellness gift.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Button("Open Now") {
                            action()
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(Color.pink)
                        .clipShape(Capsule())
                    }
                    
                    Spacer()
                    
                    Image(systemName: "gift.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.pink)
                }
                .padding()
            )
            .frame(height: 170)
            .padding(.horizontal)
    }
}

#Preview {
    DailySparkleCard(action: {})
}

