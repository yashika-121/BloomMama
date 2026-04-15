//
//  EmojiSetModel.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import Foundation
import SwiftUI
import Combine
enum Mood: String, CaseIterable, Identifiable {
    case happy, excited, tired, sad, nervous

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .happy: return "😊"
        case .excited: return "😄"
        case .tired: return "😴"
        case .sad: return "😔"
        case .nervous: return "😰"
        }
    }
    
  
    var title: String {
        rawValue.capitalized
    }

    var message: String {
        switch self {
        case .happy:
            return "I am glad to hear this 💖 Want to share more?"
        case .excited:
            return "I love this energy! 🌈 Moments like these deserve to be noticed. Want to tell me more?"
        case .tired:
            return "Feeling tired is okay 🤍 Want to talk about it?"
        case .sad:
            return "I’m really glad you told me 🌸 Want to share what’s making you sad?"
        case .nervous:
            return "We all feel nervous sometimes 🌿 Want to share?"
        }
    }
}

class HomeViewModel: ObservableObject {
    
    @Published var selectedMood: Mood?
    @Published var moodCounts: [Mood: Int] = [:]
    
    func selectMood(_ mood: Mood) {
        selectedMood = mood
        
        moodCounts[mood, default: 0] += 1
    }
}

