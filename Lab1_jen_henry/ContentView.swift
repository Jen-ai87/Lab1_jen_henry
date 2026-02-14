import SwiftUI

struct ContentView: View {
    @State private var currentNumber = Int.random(in: 2...100)
    @State private var correctCount = 0
}

#Preview {
    ContentView()
}
