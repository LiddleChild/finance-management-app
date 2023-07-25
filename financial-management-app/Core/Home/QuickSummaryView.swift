//
//  QuickSummaryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import SwiftUI

struct QuickSummaryView: View {
    var summaryData: [(Double, Color)]
    var expense: Double
    
    var body: some View {
        ZStack {
            PieChartView(data: summaryData)
            NavigationLink {
                HistoryView()
                    .modifier(NagivationDismissModier())
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .foregroundColor(.clear)
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("Monthly expense")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color("color-5"))
                        
                        Text(String(format: "%.2f", expense))
                            .font(.system(size: 24, weight: .regular))
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
            
            QuickSummaryView(
                summaryData: [(1.0, .red), (2.0, .green), (3.0, .blue), (4.0, .yellow)],
                expense: 123.45)
            .environmentObject(ViewModel())
            .environmentObject(ModalViewModel.shared)
        }
    }
}
