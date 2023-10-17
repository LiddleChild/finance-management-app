//
//  HomeView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var modalViewModel: ModalViewModel
    @EnvironmentObject private var viewModel: MainViewModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var path: [ViewLists] = []
    
    var body: some View {
        ContentTemplate {
            VStack(alignment: .center, spacing: 32) {
                HeaderView(
                    header: "Hello,",
                    subheader: "Gaben Newell")
                
                MonthlyExpenseView(
                    summaryData: homeViewModel.transaction.getExpenseSummary(),
                    expense: homeViewModel.transaction.getExpenseAmount())
                .frame(height: 256 + 128 - 48)
                .tabViewStyle(.page)
                
                RecentlyView(transactions: homeViewModel.todayTransactions)
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            homeViewModel.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @StateObject static var viewModel = MainViewModel()
    static var previews: some View {
        ZStack {
            HomeView()
                .environmentObject(viewModel)
                .environmentObject(ModalViewModel.shared)
            
            Modal()
        }
    }
}
