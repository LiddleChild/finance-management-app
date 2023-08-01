//
//  QuickSummaryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import SwiftUI

struct QuickSummaryView: View {
    @EnvironmentObject var navigationCenter: NavigationCenter
    
    var summaryData: [(Double, Color)]
    
    var body: some View {
        ZStack {
            PieChartView(data: summaryData)
            
            Button {
                navigationCenter.navigate(.history)
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .foregroundColor(.clear)
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("Quick Summary")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color("color-5"))
                    }
                }
            }
        }
    }
}

struct QuickSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            QuickSummaryView(summaryData: [(1.0, .red), (2.0, .green), (3.0, .blue), (4.0, .yellow)])
            
            .environmentObject(ContentViewModel())
            .environmentObject(ModalViewModel.shared)
            .environmentObject(NavigationCenter.shared)
        }
    }
}
