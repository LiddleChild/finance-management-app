//
//  MainView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 8/8/2566 BE.
//

import SwiftUI

struct MainView: View {
    @StateObject private var navigationCenter = NavigationCenter.shared
    @StateObject private var modalViewModel = ModalViewModel.shared
    @StateObject private var contentViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationCenter.path) {
            ZStack {
                TabView(selection: $navigationCenter.selectedTab) {
                    HomeView()
                        .tag(NavigationTab.home)
                    
                    HistoryView()
                        .tag(NavigationTab.history)
                    
                    SummaryView()
                        .tag(NavigationTab.summary)
                    
                    SettingView()
                        .tag(NavigationTab.setting)
                }
                
                NavigationTabMenu(selectedTab: $navigationCenter.selectedTab) { tab in
                    if tab == .create {
                        navigationCenter.goto(.ADD_TRANSACTION_VIEW)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 44)
                .padding(.horizontal, 24)
            }
            .toolbar(.visible)
            .ignoresSafeArea()
            .navigationDestination(for: ViewLists.self) { path in
                switch path {
                case .ADD_TRANSACTION_VIEW:
                    AddTransactionView().modifier(NagivationDismissModier())
                }
            }
        }
        .overlay(Modal())
        .environmentObject(contentViewModel)
        .environmentObject(modalViewModel)
        .environmentObject(navigationCenter)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
