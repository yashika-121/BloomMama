//
//  SentimentManager.swift
//  BloomMama
//
//  Created by Yashika Sharma on 14/02/26.
//

import Foundation
import NaturalLanguage
import SwiftUI
import Combine

final class SentimentManager: ObservableObject {
    
    @Published var sentimentScore: Double = 0
    @Published var response: String = ""
    
    func analyze(text: String) {
        sentimentScore = calculateScore(from: text)
        response = generateResponse(for: sentimentScore)
    }
    
    private func calculateScore(from text: String) -> Double {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        
        let (sentiment, _) = tagger.tag(
            at: text.startIndex,
            unit: .paragraph,
            scheme: .sentimentScore
        )
        
        return Double(sentiment?.rawValue ?? "0") ?? 0
    }
    
    private func generateResponse(for score: Double) -> String {
        switch score {
        case ..<(-0.6):
            return "I’m really sorry you're feeling this way 💛 You’re not alone."
        case -0.6..<(-0.2):
            return "It sounds like today feels heavy. I’m here for you."
        case -0.2...0.2:
            return "I feel you 🌸"
        case 0.2..<0.6:
            return "That sounds comforting 🌸 I’m glad you shared."
        default:
            return "That’s beautiful to hear ✨ Keep shining!"
        }
    }
    
    func moodColor() -> Color {
        switch sentimentScore {
        case ..<(-0.3):
            return .blue.opacity(0.15)
        case -0.3...0.3:
            return .gray.opacity(0.08)
        default:
            return .pink.opacity(0.15)
        }
    }
}

