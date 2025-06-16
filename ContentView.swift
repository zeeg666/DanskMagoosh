import SwiftUI

struct ContentView: View {
    @State private var showingStudy = false
    
    var body: some View {
        NavigationView {
            if showingStudy {
                StudyView(deck: SampleData.greVerbalDeck) {
                    showingStudy = false
                }
            } else {
                HomeView {
                    showingStudy = true
                }
            }
        }
    }
}