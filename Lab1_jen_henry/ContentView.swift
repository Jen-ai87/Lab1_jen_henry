import SwiftUI

struct ContentView: View {
    @State private var currentNumber = Int.random(in: 2...100)
    @State private var correctCount = 0
    @State private var wrongCount = 0
    @State private var totalAttempts = 0
    @State private var feedbackSymbol: String? = nil
}

#Preview {
    ContentView()
}
