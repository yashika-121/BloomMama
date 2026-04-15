//
//  QuoteOfDayCard.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//
import SwiftUI

struct QuoteOfDayCard: View {
    
    @ObservedObject var speechManager: SpeechManager
    
    private let homePage = HomePage()
    private var todayQuote: Home {
        homePage.quoteForToday()
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            
                RoundedRectangle(cornerRadius: 25)
                        .fill(Color.pink.opacity(0.08))
                
            
            Text("“")
                .font(.system(size: 100))
                .foregroundColor(Color.pink.opacity(0.15))
                .offset(x: -8, y: -25)
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    
                    Text("QUOTE OF THE DAY")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                        .tracking(1.5)
                    
                    Spacer()
                    
                    Button {
                        speechManager.toggleSpeech(
                            text: todayQuote.quoteOfDay
                        )
                    } label: {
                        Image(systemName: speechManager.isSpeaking ?
                              "speaker.wave.2.fill" :
                              "speaker.slash.fill")
                            .foregroundStyle(.pink)
                            .font(.headline)
                    }
                    .accessibilityLabel(
                        speechManager.isSpeaking ?
                        "Stop reading quote" :
                        "Read quote aloud"
                    )
                }
                
                Text("\"\(todayQuote.quoteOfDay)\"")
                    .font(.headline)
                    .italic()
                    .foregroundStyle(.primary)
                    .lineSpacing(5)
                    .accessibilityLabel(todayQuote.quoteOfDay)
            }
            .padding(20)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}


#Preview {
    QuoteOfDayCard(speechManager: SpeechManager())
        .padding()
}



