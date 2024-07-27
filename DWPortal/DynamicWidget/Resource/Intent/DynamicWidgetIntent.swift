//
//  DynamicWidgetIntent.swift
//  DynamicWidget
//
//  Created by 行勇 on 2024/7/27.
//

import WidgetKit
import AppIntents

struct DynamicWidgetIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

extension DynamicWidgetIntent {
    static var smiley: DynamicWidgetIntent {
        let intent = DynamicWidgetIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    static var starEyes: DynamicWidgetIntent {
        let intent = DynamicWidgetIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}
