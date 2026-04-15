//
//  TipsRowView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import SwiftUI

struct TipsRowView: View {
    let tip: Tips
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(tip.heading)
                .font(.headline.bold())
                .foregroundStyle(.pink)
            
            Text(tip.subHeading1)
                .font(.subheadline.bold())
            
            Text(tip.body1)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(tip.subHeading2)
                .font(.subheadline.bold())
            
            Text(tip.body2)
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    TipsRowView(tip : Tips(heading: "Micro-Me Time", subHeading1: "The 10-minute Reset:", body1: "Use the first 10 minutes after the baby falls asleep not for chores, but for something that makes you feel like you—a hot tea, a chapter of a book, or just sitting in silence.", subHeading2: "Sensory Anchors:", body2:  "Use small luxuries to stay grounded. A high-quality hand cream at your desk or a favorite playlist during feeding times can keep your mood elevated. "))
}
