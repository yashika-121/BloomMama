//
//  QuoteModel.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import Foundation

struct Home: Identifiable {
    let id = UUID()
    let quoteOfDay: String
    
}

class HomePage {
    
    let home: [Home] = [
        Home(quoteOfDay: "Each part of my life provided a respite from the other and gave me a sense of proportion that I would have lacked if I had only one."),
        
        Home(quoteOfDay: "I don't think women can 'have it all.' I think we can have it all at different times, but it’s a constant juggle."),
        
        Home(quoteOfDay: "We need to do a better job of putting ourselves higher on our own 'to-do' list."),
        
        Home(quoteOfDay: "If I am at home, I am missing something at work. If I am at work, I am missing something at home."),
        
        Home(quoteOfDay: "Done is better than perfect. We need to stop striving for 'having it all' and start striving for 'doing what matters.'"),
        
        Home(quoteOfDay: "I am not the first woman to multi-task."),
        
        Home(quoteOfDay: "I think being a mother has made me more of a champion."),
        
        Home(quoteOfDay: "The most important relationship is the one you have with yourself.")
    ]
    
    func quoteForToday() -> Home {
        let day = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
        let index = day % home.count
        return home[index]
    }
}

