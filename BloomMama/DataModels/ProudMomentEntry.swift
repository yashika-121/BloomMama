//
//  ProudMomentEntry.swift
//  BloomMama
//
//  Created by Yashika Sharma on 15/02/26.
//

import Foundation

struct ProudMomentEntry: Identifiable, Codable {
    let id: UUID
    let text: String
    let response: String
    let date: Date
}

