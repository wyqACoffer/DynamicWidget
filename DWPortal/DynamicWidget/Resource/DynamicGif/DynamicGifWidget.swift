//
//  DynamicGifWidget.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import WidgetKit
import SwiftUI

struct DynamicGifWidget: Widget {
    let kind: String = "DynamicGifWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: DynamicWidgetIntent.self,
            provider: DynamicWidgetProvider()
        ) { entry in
            DynamicGifEntryView(entry: entry).containerBackground(.fill.tertiary, for: .widget)
                
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Gif动画")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
