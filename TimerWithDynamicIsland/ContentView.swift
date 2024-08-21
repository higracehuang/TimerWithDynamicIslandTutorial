import SwiftUI

struct ContentView: View {
  @State private var timer: Timer? = nil
  @State private var secondsElapsed = 0
  @State private var isRunning = false
  
  var body: some View {
    VStack {
      Text("\(secondsElapsed) seconds")
        .font(.largeTitle)
      
      Button(action: {
        if self.isRunning {
          self.timer?.invalidate()
          self.isRunning = false
          self.secondsElapsed = 0
        } else {
          self.startTimer()
          self.isRunning = true
        }
      }) {
        Text(isRunning ? "Stop" : "Start")
          .font(.title)
      }
    }
  }
  
  private func startTimer() {
    self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
      self.secondsElapsed += 1
    }
  }
}

#Preview {
  ContentView()
}

