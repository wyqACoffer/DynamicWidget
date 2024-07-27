//
//  DynamicWidgetProvider.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import SwiftUI
import WidgetKit

struct DynamicWidgetProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DynamicWidgetEntry {
        DynamicWidgetEntry(date: Date(), configuration: DynamicWidgetIntent())
    }
    
    func snapshot(for configuration: DynamicWidgetIntent, in context: Context) async -> DynamicWidgetEntry {
        DynamicWidgetEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: DynamicWidgetIntent, in context: Context) async -> Timeline<DynamicWidgetEntry> {
        var entries: [DynamicWidgetEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = DynamicWidgetEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}
