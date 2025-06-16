import Foundation

struct Flashcard: Identifiable {
    let id = UUID()
    let front: String
    let back: String
}

struct Deck {
    let name: String
    let cards: [Flashcard]
}