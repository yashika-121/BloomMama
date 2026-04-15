//
//  MeTimeView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//
import SwiftUI

struct MeTimeView: View {
    
    @AppStorage("isMeTimeActive") private var isMeTimeActive = false
    
    @State private var hours = 0
    @State private var minutes = 10
    @State private var seconds = 0
    
    @State private var showTimer = false
    @State private var totalSeconds = 0
    @StateObject private var speechManager = SpeechManager()

    var body: some View {
        
        ZStack {
            
            FloatingParticlesView()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    
                    // MARK: Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Want to clear your mind?")
                            .font(.title2.bold())
                            .foregroundStyle(.pink)
                        
                        Text("Take a short break")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    
                    // MARK: Timer Card
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("During this time app notifications will be paused. But you can resume it anytime by clicking on cancel.")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack(spacing: 10) {
                            
                            Picker("Hours", selection: $hours) {
                                ForEach(0..<24) { Text("\($0) h") }
                            }
                            .frame(width: 80, height: 100)
                            
                            Picker("Minutes", selection: $minutes) {
                                ForEach(0..<60) { Text("\($0) m") }
                            }
                            .frame(width: 80, height: 100)
                            
                            Picker("Seconds", selection: $seconds) {
                                ForEach(0..<60) { Text("\($0) s") }
                            }
                            .frame(width: 80, height: 100)
                        }
                        .pickerStyle(.wheel)
                        
                        HStack {
                            
                            Button("Cancel") {
                                hours = 0
                                minutes = 0
                                seconds = 0
                            }
                            .frame(width: 60, height: 60)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                            
                            Spacer()
                            
                            Button("Start") {
                                totalSeconds = hours * 3600 + minutes * 60 + seconds
                                if totalSeconds > 0 {
                                    showTimer = true
                                    isMeTimeActive = true
                                }
                            }
                            .frame(width: 60, height: 60)
                            .background(Color.pink)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.pink.opacity(0.04))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.pink.opacity(0.2), lineWidth: 1)
                    )
                    
                    
                    // MARK: Self Care Section
                    SelfCareSectionView(speechManager: speechManager)
                }
                .padding(.horizontal, 20)
                .padding(.top)
            }
        }
        .navigationDestination(isPresented: $showTimer) {
            TimeView(totalSeconds: totalSeconds)
        }
    }
}


#Preview {
    NavigationStack {
        MeTimeView()
    }
}


