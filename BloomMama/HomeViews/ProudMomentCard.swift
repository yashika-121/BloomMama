//
//  ProudMomentCard.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//
import SwiftUI

struct ProudMomentCard: View {
    
    @State private var proudText: String = ""
    @State private var isSaved: Bool = false
    @StateObject private var sentimentManager = SentimentManager()
    @StateObject private var voiceManager = VoiceRecorderManager()
    
    @State private var showDetail = false
    @State private var entries: [ProudMomentEntry] = []
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
           
            
            HStack {
                
                Text("A thought for your heart...")
                    .font(.title3.bold())
                
                Spacer()
                
                Button {
                    handleRecording()
                } label: {
                    ZStack {
                        Circle()
                            .fill(voiceManager.isRecording ? Color.red.opacity(0.15) : Color.pink.opacity(0.15))
                            .frame(width: 42, height: 42)
                            .scaleEffect(voiceManager.isRecording ? 1.2 : 1)
                            .animation(
                                voiceManager.isRecording ?
                                .easeInOut(duration: 0.8).repeatForever(autoreverses: true)
                                : .default,
                                value: voiceManager.isRecording
                            )
                        
                        Image(systemName: voiceManager.isRecording ? "stop.fill" : "mic.fill")
                            .foregroundColor(voiceManager.isRecording ? .red : .pink)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .buttonStyle(.plain)
            }
            
          
            
            HStack {
                Spacer()
                
                Button {
                    showDetail = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "book.fill")
                            .font(.caption)
                        
                        Text("View your past reflections")
                            .font(.caption.weight(.semibold))
                    }
                    .foregroundStyle(.pink)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.pink.opacity(0.12))
                    )
                }
                .buttonStyle(.plain)
            }
            
          
            
            TextField(
                "Write down one thing you're proud of today.\nNo one's watching.",
                text: $proudText,
                axis: .vertical
            )
            .lineLimit(3...5)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.pink.opacity(0.08))
            )
            
            
            
            if isSaved {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Thanks for sharing 💕")
                        .font(.subheadline)
                        .foregroundStyle(.pink)
                    
                    if !sentimentManager.response.isEmpty {
                        Text(sentimentManager.response)
                            .font(.subheadline)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(sentimentManager.moodColor())
                            )
                    }
                }
                .transition(.opacity)
            }
            
           
            HStack {
                Spacer()
                
                Button {
                    handleSaveButton()
                } label: {
                    Text(isSaved ? "Edit" : "Save")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(proudText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                                      ? Color.gray.opacity(0.3)
                                      : Color.pink)
                        )
                }
                .disabled(proudText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.pink.opacity(0.08))
        )
        .animation(.easeInOut(duration: 0.25), value: isSaved)
        .sheet(isPresented: $showDetail) {
            ProudMomentDetailView(entries: entries)
        }
        .onAppear {
            loadEntries()
        }
    }
}

extension ProudMomentCard {
    
    private func handleRecording() {
        
        if voiceManager.isRecording {
            
            voiceManager.stopRecording()
            
            proudText = voiceManager.transcribedText
            autoSaveAfterVoice()
            
        } else {
            
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            voiceManager.startRecording()
        }
    }
    
    
    private func autoSaveAfterVoice() {
        
        guard !proudText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        sentimentManager.analyze(text: proudText)
        
        let newEntry = ProudMomentEntry(
            id: UUID(),
            text: proudText,
            response: sentimentManager.response,
            date: Date()
        )
        
        entries.insert(newEntry, at: 0)
        saveEntries()
        
        withAnimation {
            isSaved = true
        }
    }
    
    
    private func handleSaveButton() {
        
        if isSaved {
            withAnimation {
                isSaved = false
            }
            return
        }
        
        sentimentManager.analyze(text: proudText)
        
        let newEntry = ProudMomentEntry(
            id: UUID(),
            text: proudText,
            response: sentimentManager.response,
            date: Date()
        )
        
        entries.insert(newEntry, at: 0)
        saveEntries()
        
        withAnimation {
            isSaved = true
        }
        
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
    
    
    private func saveEntries() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: "proudEntries")
        }
    }
    
    
    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: "proudEntries"),
           let decoded = try? JSONDecoder().decode([ProudMomentEntry].self, from: data) {
            entries = decoded
        }
    }
}

#Preview {
    ProudMomentCard()
        .padding()
}



