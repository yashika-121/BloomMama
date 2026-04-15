//
//  TipsModel.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import Foundation

struct Tips: Identifiable {
    let id = UUID()
    let heading: String
    let subHeading1: String
    let body1: String
    let subHeading2: String
    let body2: String
}

class TipsModel {
    
    static let tip: [Tips] = [
        Tips(
            heading: "Micro-Me Time",
            subHeading1: "The 10-minute Reset:",
            body1: "Use the first 10 minutes after the baby falls asleep not for chores, but for something that makes you feel like you—a hot tea, a chapter of a book, or just sitting in silence.",
            subHeading2: "Sensory Anchors:",
            body2: "Use small luxuries to stay grounded. A high-quality hand cream at your desk or a favorite playlist during feeding times can keep your mood elevated."
        ),
        
        Tips(
            heading: "Work-Life Integration",
            subHeading1: "Peak Power Hours:",
            body1: "If your baby is calmest in the morning, do your deep work then. Save low-energy tasks for later.",
            subHeading2: "One-Handed Workflow:",
            body2: "Use voice-to-text for emails while rocking the baby or a sling to stay hands-free."
        )
    ]
}
