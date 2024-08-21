//
//  TimerWidgetAttributes.swift
//  TimerWithDynamicIsland
//
//  Created by Le Huang on 8/21/24.
//

import ActivityKit

struct TimerWidgetAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    // Dynamic stateful properties about your activity go here!
    var emoji: String
  }
  
  // Fixed non-changing properties about your activity go here!
  var name: String
}