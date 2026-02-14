import SwiftUI

struct ContentView: View {
    @State private var currentNumber = Int.random(in: 2...100)
    @State private var correctCount = 0
    @State private var wrongCount = 0
    @State private var totalAttempts = 0
    @State private var feedbackSymbol: String? = nil
    @State private var showAlert = false
    @State private var timer: Timer? = nil
    @State private var timeRemaining = 5.0

    var body: some View {

    }

    func isPrime(_ n: Int) -> Bool {
       if n < 2 { return false }
        if n < 4 { return true }
        if n % 2 == 0 { return false }
        var i = 3
        while i * i <= n {
            if n % i == 0 { return false }
            i += 2
        }
        return true
    }

    func checkAnswer(userSaidPrime: Bool) {
       
    }

    func timeExpired() {
       
    }

    func generateNewNumber() {
       
    }

    func startTimer() {
        
    }
}

#Preview {
    ContentView()
}
