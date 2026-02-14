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
         ZStack {
           
        }
        .onAppear {
            startTimer()
        }
        .alert("Results", isPresented: $showAlert) {
            Button("Play Again") {
                correctCount = 0
                wrongCount = 0
                totalAttempts = 0
                generateNewNumber()
            }
        } message: {
            Text("Correct answers: \(correctCount)\nWrong answers: \(wrongCount)")
        }
        
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
       timer?.invalidate()

        let correct = isPrime(currentNumber)

        if userSaidPrime == correct {
            correctCount += 1
            feedbackSymbol = "checkmark"
        } else {
            wrongCount += 1
            feedbackSymbol = "xmark"
        }

        totalAttempts += 1

        if totalAttempts % 10 == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                showAlert = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                generateNewNumber()
            }
        }
    }

    func timeExpired() {
       wrongCount += 1
        totalAttempts += 1
        feedbackSymbol = "xmark"

        if totalAttempts % 10 == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                showAlert = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                generateNewNumber()
            }
        }
    }

    func generateNewNumber() {
       currentNumber = Int.random(in: 2...100)
        feedbackSymbol = nil
        timeRemaining = 5.0
        startTimer()
    }

    func startTimer() {
        timer?.invalidate()
        timeRemaining = 5.0
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            timeExpired()
        }
    }
}

#Preview {
    ContentView()
}
