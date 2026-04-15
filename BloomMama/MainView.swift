//
//  MainView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
import SwiftUI

struct MainView: View {
    
    @Binding var hasStarted: Bool
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color.white.opacity(1.1), Color.pink],
                center: .center,
                startRadius: 50,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack(spacing: 4) {
                Spacer()
                
                Image("Yoursicon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                
                Text("BloomMama")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        LinearGradient(colors: [.purple, .pink], startPoint: .leading, endPoint: .trailing)
                    )
                
                Text("Your quiet space for Balance and Peace")
                    .font(.headline.bold())
                    .foregroundStyle(
                        LinearGradient(colors: [.purple, .pink], startPoint: .leading, endPoint: .trailing)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Label("Release mental load", systemImage: "brain.head.profile.fill")
                    Label("Protect your time", systemImage: "timer")
                    Label("Together feels lighter", systemImage: "heart.circle.fill")
                }
                .font(.headline.bold())
                .foregroundStyle(.pink)
                .padding(.top, 30)
                
                Spacer()
                
                Button {
                    hasStarted = true
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.25))
                        )
                        .padding(.horizontal, 40)
                }
            }
        }
    }
}

#Preview {
    MainView(hasStarted: .constant(false))
}

