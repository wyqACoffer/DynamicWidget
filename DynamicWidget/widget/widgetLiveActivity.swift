//
//  widgetLiveActivity.swift
//  widget
//
//  Created by 行勇 on 2023/10/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: widgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension widgetAttributes {
    fileprivate static var preview: widgetAttributes {
        widgetAttributes(name: "World")
    }
}

extension widgetAttributes.ContentState {
    fileprivate static var smiley: widgetAttributes.ContentState {
        widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: widgetAttributes.ContentState {
         widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: widgetAttributes.preview) {
   widgetLiveActivity()
} contentStates: {
    widgetAttributes.ContentState.smiley
    widgetAttributes.ContentState.starEyes
}
