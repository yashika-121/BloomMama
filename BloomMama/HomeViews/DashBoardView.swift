//
//  DashBoardView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//
import SwiftUI

struct DashBoardView: View {
    
    @State private var showBurst = false
    @State private var showAlert = false
    @State private var showReveal = false
    @State private var todaySparkle: DailySparkle?
    @StateObject private var speechManager = SpeechManager()
    
    private let sparkleKey = "lastSparkleDate"
    
    @StateObject private var viewModel = HomeViewModel()
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        case 17..<21: return "Good Evening"
        default: return "Good Night"
        }
    }
    
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            
           
            FloatingParticlesView()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    
                   
                    VStack(alignment: .leading, spacing: 2) {
                        
                        HStack {
                            Text("\(greeting) Mama!")
                                .font(.title2.bold())
                                .foregroundStyle(.pink)
                            
                            Spacer()
                            
                            Button {
                                speechManager.toggleSpeech(
                                    text: "\(greeting) Mama! Today is \(currentDate)."
                                )
                            } label: {
                                Image(systemName:
                                        speechManager.isSpeaking ?
                                      "speaker.wave.2.fill" :
                                      "speaker.slash.fill")
                                    .foregroundStyle(.pink)
                            }
                        }
                        
                        Text(currentDate)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("\(greeting) Mama! \(currentDate)")
                    
                    
                   
                    DailySparkleCard {
                        triggerExplosion()
                    }
                    
                    MoodSectionView(viewModel: viewModel)
                    
                    ProudMomentCard()
                        .padding()
                    
                    QuoteOfDayCard(speechManager: speechManager)
                        .padding()
                }
                .padding(.bottom, 100)
            }
            
            if showBurst {
                GiftBurstView()
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .alert("Come Back Tomorrow 💖", isPresented: $showAlert) {
            Button("Okay", role: .cancel) { }
        } message: {
            Text("You’ve already opened your Daily Sparkle today. A new one awaits tomorrow ✨")
        }
        .sheet(isPresented: $showReveal) {
            if let sparkle = todaySparkle {
                SparkleRevealView(sparkle: sparkle)
            }
        }
    }
    
    func triggerExplosion() {
        
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastDate = UserDefaults.standard.object(forKey: sparkleKey) as? Date {
            let savedDay = Calendar.current.startOfDay(for: lastDate)
            
            if savedDay == today {
                showAlert = true
                return
            }
        }
        
        todaySparkle = SparkleLibrary.sparkles.randomElement()
        UserDefaults.standard.set(today, forKey: sparkleKey)
        
        withAnimation {
            showBurst = true
        }
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation {
                showBurst = false
                showReveal = true
            }
        }
    }
}

#Preview {
    DashBoardView()
}





