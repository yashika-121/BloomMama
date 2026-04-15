//
//  TimeView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 13/02/26.
//

import SwiftUI

struct TimeView: View {
    
    @AppStorage("isMeTimeActive") private var isMeTimeActive = false

    let totalSeconds: Int
    @State private var remainingSeconds: Int
    @State private var timer: Timer?

    @Environment(\.dismiss) var dismiss

    init(totalSeconds: Int) {
        self.totalSeconds = totalSeconds
        _remainingSeconds = State(initialValue: totalSeconds)
    }

    var body: some View {
        VStack {

            Spacer()

            Text(timeText)
                .font(.system(size: 56, weight: .bold))
                .foregroundColor(Color.pink.opacity(0.6))
                .padding()

            Spacer()
            
            Text("Notifications Paused")
                .font(.caption)
                .foregroundColor(.pink.opacity(0.7))
            Spacer().frame(height: 30)
            
            Button("Stop") {
                stopTimer()
                dismiss()
                isMeTimeActive = false
                
            }
            .frame(width: 100, height: 100)
            .background(Color.gray.opacity(0.2))
            .clipShape(Circle())
            .font(.headline)

            Spacer()
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }



    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                if remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else {
                    stopTimer()
                    dismiss()
                }
            }
        }
    }


    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    
    var timeText: String {
        let h = remainingSeconds / 3600
        let m = (remainingSeconds % 3600) / 60
        let s = remainingSeconds % 60

        if h > 0 {
            return String(format: "%02d:%02d:%02d", h, m, s)
        } else {
            return String(format: "%02d:%02d", m, s)
        }
    }
}

#Preview {
    TimeView(totalSeconds: 300)
}
