//
//  TimerWidgetBundle.swift
//  TimerWidget
//
//  Created by Le Huang on 8/21/24.
//

import WidgetKit
import SwiftUI

@main
struct TimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        TimerWidget()
        TimerWidgetLiveActivity()
    }
}
