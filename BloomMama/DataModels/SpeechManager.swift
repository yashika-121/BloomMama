//
//  SpeechManager.swift
//  BloomMama
//
//  Created by Yashika Sharma on 16/02/26.
//

import Foundation
import AVFoundation
import Combine

@MainActor
final class SpeechManager: NSObject, ObservableObject, @preconcurrency AVSpeechSynthesizerDelegate {
    
    private let synthesizer = AVSpeechSynthesizer()
    
    @Published var isSpeaking: Bool = false
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func toggleSpeech(text: String) {
        if synthesizer.isSpeaking {
            stop()
        } else {
            speak(text: text)
        }
    }
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        
        
        if let femaleVoice = AVSpeechSynthesisVoice(
            identifier: "com.apple.voice.super-compact.en-US.Samantha"
        ) {
            utterance.voice = femaleVoice
        } else {
           
            utterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
        }
        
        utterance.rate = 0.42   // softer
        utterance.pitchMultiplier = 1.08
        
        synthesizer.speak(utterance)
        isSpeaking = true
    }

    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
    }
    
   
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                           didFinish utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = false
        }
    }
}


extension SpeechManager: @unchecked Sendable { }

