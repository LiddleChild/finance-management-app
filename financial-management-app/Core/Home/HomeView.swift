//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

enum NavigationViews {
    case ADD_TRANSACTION_VIEW
}

struct HomeView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @EnvironmentObject private var viewModel: ViewModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var path: [NavigationViews] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 32) {
                    HeaderView(
                        header: "Hello,",
                        subheader: "Gaben Newell")
                    
                    TabView {
                        MonthlyExpenseView(
                            summaryData: homeViewModel.transaction.getExpenseSummary(),
                            expense: homeViewModel.transaction.getExpenseAmount())
                        
                        QuickSummaryView(
                            summaryData: homeViewModel.transaction.getExpenseSummary(),
                            expense: homeViewModel.transaction.getExpenseAmount())
                    }
                    .frame(height: 256 + 128 - 48)
                    .tabViewStyle(.page)
                    
                    RecentlyView(
                        transactions: homeViewModel.todayTransactions)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                Button {
                    path.append(NavigationViews.ADD_TRANSACTION_VIEW)
                } label: {
                    Text("+")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundColor(Color("color-5"))
                        .padding(24)
                        .background(Circle().foregroundColor(Color("color-4")))
                }
                .padding(28)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar(.visible)
            .navigationDestination(for: NavigationViews.self) { path in
                switch path {
                case NavigationViews.ADD_TRANSACTION_VIEW:
                    AddTransactionView(path: $path)
                        .modifier(NagivationDismissModier())
                }
            }
            .onAppear {
                viewModel.fetch()
                homeViewModel.fetch()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()
    static var previews: some View {
        ZStack {
            HomeView()
                .environmentObject(viewModel)
                .environmentObject(ModalViewModel.shared)
            
            Modal()
        }
    }
}
