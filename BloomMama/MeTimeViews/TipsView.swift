//
//  TipsView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import SwiftUI

struct TipsView: View {
    
    let tips = TipsModel.tip
    @StateObject private var speechManager = SpeechManager()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(tips) { tip in
                    
                    VStack(alignment: .trailing, spacing: 12) {
                        
                        // 🔊 Speech Button (top right)
                        HStack {
                            Spacer()
                            
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
                        
                        // Tip Content
                        TipsRowView(tip: tip)
                    }
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
            .padding(.horizontal, 20)
            .padding(.top)
        }
        .navigationTitle("All Tips")
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    TipsView()
}

