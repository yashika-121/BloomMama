//
//  DailySparkleModel.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import Foundation

struct DailySparkle: Identifiable {
    let id = UUID()
    let affirmation: String
    let action: String
    let permission: String
}

struct SparkleLibrary {
    
    static let sparkles: [DailySparkle] = [
        
        DailySparkle(
            affirmation: "You are doing better than you think.",
            action: "Drink one glass of water just for yourself.",
            permission: "You are allowed to move at your own pace."
        ),
        
        DailySparkle(
            affirmation: "Your effort matters, even if unseen.",
            action: "Step outside for 3 minutes and take a deep breath.",
            permission: "You are allowed to rest without guilt."
        ),
        
        DailySparkle(
            affirmation: "You are growing through what you’re going through.",
            action: "Stretch your shoulders and neck for 60 seconds.",
            permission: "You are allowed to say no today."
        ),
        
        DailySparkle(
            affirmation: "You are enough — even on messy days.",
            action: "Smile at yourself in the mirror.",
            permission: "You are allowed to not be perfect."
        ),
        
        DailySparkle(
            affirmation: "Your dreams still matter.",
            action: "Write one small goal for yourself this week.",
            permission: "You are allowed to want more."
        )
    ]
}

