//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

private struct QuickSummaryView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var path: [NavigationViews]
    
    var body: some View {
        ZStack {
            PieChartView(data: viewModel.getQuickSummary())
            
            Button {
                path.append(NavigationViews.HISTORY_VIEW)
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
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HeaderView(header: "Hello,", subheader: "Gaben Newell")
                        .padding(.bottom, 48)
                    
                    QuickSummaryView(path: $path)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                ZStack(alignment: .bottomTrailing) {
                    Button {
                        path.append(NavigationViews.ADD_TRANSACTION_VIEW)
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
            .navigationDestination(for: NavigationViews.self) { path in
                switch path {
                case NavigationModel.HISTORY_VIEW:
                    HistoryView()
                        .modifier(NagivationDismissModier())
                    
                case NavigationModel.ADD_TRANSACTION_VIEW:
                    AddTransactionView(path: $path)
                        .modifier(NagivationDismissModier())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
