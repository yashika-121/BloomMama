//
//  SelfCareSectionView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 16/02/26.
//

import SwiftUI

struct SelfCareSectionView: View {
    
    @ObservedObject var speechManager: SpeechManager
    
    private var firstTip: Tips? {
        TipsModel.tip.first
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Self-Care Tips")
                        .font(.title2.bold())
                        .foregroundStyle(.pink)
                    
                    Text("Small reminders for your peace ✨")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                // 🔊 Speech Button
                if let tip = firstTip {
                    Button {
                        let fullText = """
                        \(tip.heading).
                        \(tip.subHeading1).
                        \(tip.body1).
                        \(tip.subHeading2).
                        \(tip.body2).
                        """
                        
                        speechManager.toggleSpeech(text: fullText)
                    } label: {
                        Image(systemName:
                                speechManager.isSpeaking ?
                              "speaker.wave.2.fill" :
                              "speaker.slash.fill")
                            .foregroundStyle(.pink)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color.pink.opacity(0.15))
                            )
                    }
                }
                
                NavigationLink {
                    TipsView()
                } label: {
                    HStack(spacing: 4) {
                        Text("See More")
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                    }
                    .font(.caption.bold())
                    .foregroundStyle(.pink)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.pink.opacity(0.15))
                    )
                }
            }
            
            // Tip Card
            if let tip = firstTip {
                TipsRowView(tip: tip)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.pink.opacity(0.04))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.pink.opacity(0.2), lineWidth: 1)
                    )
            }
        }
    }
}



#Preview {
    SelfCareSectionView(speechManager: SpeechManager())
}
