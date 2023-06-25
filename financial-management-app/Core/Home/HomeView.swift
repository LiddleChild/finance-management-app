//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

private struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello,")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("color-5"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Gaben Newell")
                .font(.system(size: 24, weight: .light))
                .foregroundColor(Color("color-5"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct HomeView: View {
    let data = [
        (0.45, Color(hex: 0x128000)),
        (1.0, Color(hex: 0x900000)),
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HeadingView()
                    .padding(.bottom, 48)
                
                ZStack {
                    PieChartView(data: data)
                    
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .frame(width: 216, height: 216)
//
                    Text("12,345.67")
                        .font(.system(size: 24, weight: .regular))
                        .foregroundColor(Color("color-5"))
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
