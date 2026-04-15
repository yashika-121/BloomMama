//
//  ProudMomentDetailView..swift
//  BloomMama
//
//  Created by Yashika Sharma on 15/02/26.
//
import  SwiftUI
struct ProudMomentDetailView: View {
    
    var entries: [ProudMomentEntry]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    if entries.isEmpty {
                        Text("No reflections yet 🌷 Type and Save your feelings.")
                            .foregroundStyle(.secondary)
                    }
                    
                    ForEach(entries) { entry in
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(entry.date, style: .date)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Text(entry.text)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.pink.opacity(0.08))
                                )
                            
                            Text(entry.response)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.pink.opacity(0.15))
                                )
                        }
                        .padding(.bottom, 8)
                    }
                }
                .padding()
            }
            .navigationTitle("Your Reflections 📖")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    
    let sampleEntries: [ProudMomentEntry] = [
        ProudMomentEntry(
            id: UUID(),
            text: "I completed a challenging task and learned a lot!",
            response: "I felt proud because I stayed consistent and asked for help when needed.",
            date: Date()
        ),
        ProudMomentEntry(
            id: UUID(),
            text: "I went for a run even though I didn't feel like it.",
            response: "It reminded me I can follow through on my commitments.",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        )
    ]

    ProudMomentDetailView(entries: sampleEntries)
}
