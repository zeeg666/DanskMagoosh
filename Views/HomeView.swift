import SwiftUI

struct HomeView: View {
    let onStartStudy: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            // Header
            VStack(spacing: 16) {
                Text("📚")
                    .font(.system(size: 80))
                
                Text("GRE Flashcards")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Master essential vocabulary")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // Deck Card
            VStack(spacing: 16) {
                Button(action: onStartStudy) {
                    VStack(spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("GRE Verbal Essentials")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text("20 essential words")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "play.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(20)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}