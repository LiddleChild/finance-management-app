//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

private struct QuickSummaryView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let data = [
        (0.45, Color(hex: 0x128000)),
        (1.0, Color(hex: 0x900000)),
    ]
    
    var body: some View {
        ZStack {
            PieChartView(data: viewModel.getQuickSummary())
            
            NavigationLink {
                HistoryView()
                    .modifier(NagivationDismissModier())
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color("color-2"))
                        .frame(width: 216, height: 216)
                    
                    VStack(spacing: 4) {
                        Text("Monthly expense")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color("color-5"))
                        
                        Text(String(format: "%.2f", viewModel.getQuickSummaryAmount()))
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(Color("color-5"))
                    }
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HeaderView(header: "Hello,", subheader: "Gaben Newell")
                        .padding(.bottom, 48)
                    
                    QuickSummaryView()
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                ZStack(alignment: .bottomTrailing) {
                    NavigationLink {
                        AddTransactionView()
                            .modifier(NagivationDismissModier())
                    } label: {
                        Text("+")
                            .font(.system(size: 28, weight: .regular))
                            .foregroundColor(Color("color-5"))
                            .padding(24)
                            .background {
                                Circle()
                                    .foregroundColor(Color("color-4"))
                            }
                    }
                }
                .padding(28)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar(.visible)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
