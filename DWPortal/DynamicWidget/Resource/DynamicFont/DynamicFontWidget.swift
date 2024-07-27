//
//  DynamicFontWidget.swift
//  DynamicWidget
//
//  Created by 行勇 on 2024/7/27.
//

import WidgetKit
import SwiftUI

struct DynamicFontWidget: Widget {
    let kind: String = "DynamicFontWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: DynamicWidgetIntent.self,
            provider: DynamicWidgetProvider()
        ) { entry in
            DynamicFontEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("字体动画")
        .supportedFamilies([.systemSmall])
    }
}
