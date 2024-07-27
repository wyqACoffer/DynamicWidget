//
//  DynamicWidgetEntryView.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import SwiftUI
import WidgetKit

struct DynamicFontEntryView : View {
    var entry: DynamicWidgetProvider.Entry
    var body: some View {
        DynamicFontView(entry: entry, name: "DynamicFont-Regular")
    }
}
