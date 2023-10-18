//
//  QuickSummary.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct MonthlyExpenseView: View {
    @EnvironmentObject var navigationCenter: NavigationCenter
    
    var summaryData: [(Double, Color)]
    var expense: Double
    
    var body: some View {
        ZStack {
            PieChartView(data: summaryData)
            
            NavigationLink {
                HistoryView().modifier(NavigationDismissModier())
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .foregroundColor(.clear)
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("Monthly expense")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(Color("color-5"))
                        
                        Text(String(format: "%.2f", expense))
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color("color-5"))
                    }
                }
            }
        }
    }
}

struct MonthlyExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTemplate {
            MonthlyExpenseView(
                summaryData: [(1.0, Color("color-red")), (2.0, Color("color-green"))],
                expense: 123.45)
            
            .environmentObject(MainViewModel())
            .environmentObject(ModalViewModel.shared)
            .environmentObject(NavigationCenter.shared)
        }
    }
}
