//
//  TimerWidgetLiveActivity.swift
//  TimerWidget
//
//  Created by Le Huang on 8/21/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TimerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
              Text(
                Date(
                  timeIntervalSinceNow: Double(context.attributes.startTime.timeIntervalSince1970) - Date().timeIntervalSince1970
                ),
                style: .timer
              )
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    
                }
                DynamicIslandExpandedRegion(.trailing) {
                  Text(
                    Date(
                      timeIntervalSinceNow: Double(context.attributes.startTime.timeIntervalSince1970) - Date().timeIntervalSince1970
                    ),
                    style: .timer
                  )
                }
                DynamicIslandExpandedRegion(.bottom) {
                }
            } compactLeading: {
                Image(systemName: "clock")
            } compactTrailing: {
              Text(
                Date(
                  timeIntervalSinceNow: Double(context.attributes.startTime.timeIntervalSince1970) - Date().timeIntervalSince1970
                ),
                style: .timer
              )
            } minimal: {
              Image(systemName: "clock")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
