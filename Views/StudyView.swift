import SwiftUI

struct StudyView: View {
    let deck: Deck
    let onFinish: () -> Void
    
    @State private var currentIndex = 0
    @State private var isFlipped = false
    
    private var currentCard: Flashcard {
        deck.cards[currentIndex]
    }
    
    private var progress: Double {
        Double(currentIndex + 1) / Double(deck.cards.count)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            // Header with progress
            VStack(spacing: 16) {
                HStack {
                    Button("Done") {
                        onFinish()
                    }
                    
                    Spacer()
                    
                    Text("\(currentIndex + 1) / \(deck.cards.count)")
                        .font(.headline)
                }
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Flashcard
            FlashcardView(
                card: currentCard,
                isFlipped: isFlipped
            ) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isFlipped.toggle()
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Navigation
            HStack(spacing: 40) {
                Button(action: previousCard) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.title)
                        .foregroundColor(currentIndex > 0 ? .blue : .gray)
                }
                .disabled(currentIndex == 0)
                
                Button(action: nextCard) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.title)
                        .foregroundColor(currentIndex < deck.cards.count - 1 ? .blue : .gray)
                }
                .disabled(currentIndex >= deck.cards.count - 1)
            }
            .padding(.bottom, 40)
        }
        .navigationBarHidden(true)
    }
    
    private func nextCard() {
        if currentIndex < deck.cards.count - 1 {
            withAnimation {
                currentIndex += 1
                isFlipped = false
            }
        }
    }
    
    private func previousCard() {
        if currentIndex > 0 {
            withAnimation {
                currentIndex -= 1
                isFlipped = false
            }
        }
    }
}

struct FlashcardView: View {
    let card: Flashcard
    let isFlipped: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 8)
                    .frame(height: 300)
                
                VStack(spacing: 20) {
                    Text(isFlipped ? "Definition" : "Word")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .textCase(.uppercase)
                    
                    Text(isFlipped ? card.back : card.front)
                        .font(.title)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    
                    if !isFlipped {
                        Text("Tap to reveal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(30)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}