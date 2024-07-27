//
//  DynamicGifView.swift
//  DynamicWidgetExtension
//
//  Created by 行勇 on 2024/7/27.
//

import SwiftUI
import ClockHandRotationKit
import SDWebImage

struct ArcView: Shape {
    var arcStartAngle: Double
    var arcEndAngle: Double
    var arcRadius: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: arcRadius,
                    startAngle: .degrees(arcStartAngle),
                    endAngle: .degrees(arcEndAngle),
                    clockwise: false)
        return path
    }
}

struct DynamicGifView: View {
    var entry: DynamicWidgetProvider.Entry
    var name: String
    var body: some View {
        if let gifPath = Bundle.main.path(forResource: name, ofType: "gif"),
           let gifData = NSData(contentsOfFile: gifPath),
           let gifImage = UIImage.sd_image(withGIFData: gifData as Data),
           let gifImages = gifImage.images, gifImages.count > 0 {
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                let arcWidth = max(width, height)
                let arcRadius = arcWidth * arcWidth
                let angle = 360.0 / Double(gifImages.count)
                let duration = gifImage.duration
                ZStack {
                    ForEach(1...gifImages.count, id: \.self) { index in
                        Image(uiImage: gifImages[index-1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                            .mask(
                                ArcView(arcStartAngle: angle * Double(index - 1),
                                        arcEndAngle: angle * Double(index),
                                        arcRadius: arcRadius)
                                .stroke(style: .init(lineWidth: arcWidth, lineCap: .square, lineJoin: .miter))
                                .frame(width: width, height: height)
                                .clockHandRotationEffect(period: .custom(duration / 2))
                                .offset(y: arcRadius) // ⚠️ 需要先进行旋转，再设置offset
                            )
                    }
                }
                .frame(width: width, height: height)
            }
        }
    }
}
