//
//  EmotionalGardenSection.swift
//  BloomMama
//
//  Created by Yashika Sharma on 15/02/26.
//

import SwiftUI

struct EmotionalGardenSection: View {
    
    var moodCounts: [Mood: Int]
    @State private var animate = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            HStack {
                Text("Your Emotional Garden 🌷")
                    .font(.title3.bold())
                    .foregroundStyle(.pink)
                
                Spacer()
            }
            
            ForEach(Mood.allCases) { mood in
                
                let count = moodCounts[mood] ?? 0
                
                HStack(spacing: 12) {
                    
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 40, height: 40)
                            .shadow(color: .pink.opacity(0.15), radius: 4, y: 2)
                        
                        Text(mood.emoji)
                            .font(.system(size: 20))
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(mood.title)
                            .font(.subheadline.weight(.medium))
                        
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                
                                Capsule()
                                    .fill(Color.gray.opacity(0.15))
                                    .frame(height: 6)
                                
                                Capsule()
                                    .fill(Color.pink.opacity(0.6))
                                    .frame(
                                        width: animate
                                        ? min(CGFloat(count) / 10 * geo.size.width, geo.size.width)
                                        : 0,
                                        height: 6
                                    )
                                    .animation(.easeOut(duration: 0.8), value: animate)
                            }
                        }
                        .frame(height: 6)
                    }
                    
                    Spacer()
                    
                    Text("\(count)")
                        .font(.headline.weight(.semibold))
                        .foregroundStyle(.pink)
                }
                .padding(.vertical, 6)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color.pink.opacity(0.08))
        )
        .onAppear {
            animate = true
        }
    }
}


#Preview {
    
    let sampleCounts: [Mood: Int] = Dictionary(uniqueKeysWithValues: Mood.allCases.map { mood in
       
        (mood,  Int.random(in: 0...10))
    })
    return EmotionalGardenSection(moodCounts: sampleCounts)
}
