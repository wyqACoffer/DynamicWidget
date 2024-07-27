//
//  DynamicGifEntryView.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import SwiftUI
import WidgetKit

struct DynamicGifEntryView : View {
    var entry: DynamicWidgetProvider.Entry
    var body: some View {
        DynamicGifView(entry: entry, name: "transformer")
    }
}

