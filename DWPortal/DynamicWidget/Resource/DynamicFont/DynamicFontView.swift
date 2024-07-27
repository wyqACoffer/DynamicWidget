//
//  DynamicFontView.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import SwiftUI

struct DynamicFontView: View {
    var entry: DynamicWidgetProvider.Entry
    var name: String
    var body: some View {
        Text(
            Calendar.current.startOfDay(for: Date()),
            style: .timer
        )
        .contentTransition(.identity) // iOS 17 新增了复杂的Timer过渡动画，想用的话可把这行注释掉
        .lineLimit(1)
        .multilineTextAlignment(.trailing) // 对齐方式必须是trailing
        .truncationMode(.head) // 截断方式必须是head
        .font(Font.custom(name, size: 85))
        .offset(x: -90, y: 50)
    }
}
