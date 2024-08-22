import SwiftUI
import ActivityKit

struct ContentView: View {
  @State private var timer: Timer? = nil
  @State private var secondsElapsed = 0
  @State private var isRunning = false
  @State private var activity: Activity<TimerWidgetAttributes>? = nil
  
  var body: some View {
    VStack {
      Text("\(secondsElapsed) seconds")
        .font(.largeTitle)
      
      Button(action: {
        if self.isRunning {
          self.stopTimer()
          self.isRunning = false
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
  
  private func stopTimer() {
    self.timer?.invalidate()
    self.secondsElapsed = 0
    
    stopLiveActivity()
  }
  
  private func startTimer() {
    self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
      self.secondsElapsed += 1
    }
    
    startLiveActivity()
  }
  
  private func startLiveActivity() {
    let attributes = TimerWidgetAttributes(startTime: Date())
    let initialState = TimerWidgetAttributes.ContentState()
    let content = ActivityContent(state: initialState,
                                  staleDate: nil,
                                  relevanceScore: 0)
    
    activity = try? Activity<TimerWidgetAttributes>.request(attributes: attributes, content: content, pushType: nil)
  }
  

  private func stopLiveActivity() {
    let contentState = TimerWidgetAttributes.ContentState()
    
    Task {
      if let activity = self.activity {
        let content = ActivityContent(state: contentState, staleDate: .now)
        await activity.end(content, dismissalPolicy: .immediate)
        self.activity = nil
      }
    }
  }
}

#Preview {
  ContentView()
}

