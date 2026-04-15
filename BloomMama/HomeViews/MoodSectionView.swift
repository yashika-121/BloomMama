//
//  MoodSectionView..swift
//  BloomMama
//
//  Created by Yashika Sharma on 15/02/26.
//

import SwiftUI

struct MoodSectionView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var showGarden = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
           
            Text("How is your heart feeling?")
                .font(.title2.bold())
                .foregroundStyle(.pink)
            
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(Mood.allCases) { mood in
                        
                        Button {
                            viewModel.selectMood(mood)
                        } label: {
                            VStack(spacing: 6) {
                                
                                Text(mood.emoji)
                                    .font(.system(size: 40))
                                
                                Text(mood.title)
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                            }
                            .frame(width: 80, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(viewModel.selectedMood == mood
                                          ? Color.pink.opacity(0.1)
                                          : Color.gray.opacity(0.1))
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
           
            if let mood = viewModel.selectedMood {
                Text(mood.message)
                    .font(.headline.bold())
                    .transition(.opacity)
            }
           
            Button {
                withAnimation(.easeInOut) {
                    showGarden.toggle()
                }
            } label: {
                HStack {
                    Text(showGarden ? "Hide Emotional Garden 🌿" : "See Emotional Garden 🌷")
                        .font(.subheadline.weight(.semibold))
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(showGarden ? 180 : 0))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.pink.opacity(0.1))
                )
            }
            .buttonStyle(.plain)
            
            
            if showGarden {
                EmotionalGardenSection(
                    moodCounts: viewModel.moodCounts
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            
                        }
        .transition(.move(edge: .bottom).combined(with: .opacity))

        .padding()
    }
}


#Preview {
    let vm = HomeViewModel()
    return MoodSectionView(viewModel: vm)
}

