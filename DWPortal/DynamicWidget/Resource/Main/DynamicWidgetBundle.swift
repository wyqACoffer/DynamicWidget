//
//  DynamicWidgetBundle.swift
//  DynamicWidget
//
//  Created by 行勇 on 2024/7/27.
//

import WidgetKit
import SwiftUI

@main
struct DynamicWidgetBundle: WidgetBundle {
    var body: some Widget {
        DynamicFontWidget()
        DynamicGifWidget()
    }
}
