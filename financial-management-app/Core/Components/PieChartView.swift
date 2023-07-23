//
//  PieChartView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct PieChartView: View {
    var data: [(Double, Color)]
    
    var body: some View {
        Canvas { context, size in
            let donut = Path { p in
                p.addEllipse(in: CGRect(origin: .zero, size: size))
                p.addEllipse(in: CGRect(x: size.width / 18,
                                        y: size.height / 18,
                                        width: size.width * (1 - 2 / 18),
                                        height: size.height * (1 - 2 / 18)
                                       ))
            }
            context.clip(to: donut, style: .init(eoFill: true))
            
            let total = data.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width / 2, y: size.height / 2)
            
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            
            let radius = min(size.width, size.height) * 0.48
            var startAngle = Angle.zero
            for (value, color) in data {
                let angle = Angle(degrees: 360 * (value / total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero,
                             radius: radius,
                             startAngle: startAngle + Angle(degrees: (data.count > 1) ? 3: 0),
                             endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(width: 256, height: 256)
    }
}
