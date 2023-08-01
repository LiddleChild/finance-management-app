//
//  ContentView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.a
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationCenter = NavigationCenter.shared
    @StateObject private var modalViewModel = ModalViewModel.shared
    @StateObject private var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationCenter.path) {
            ZStack {
                TabView(selection: $navigationCenter.selectedTab) {
                    HomeView()
                        .tag(NavigationTab.home)
                        .toolbar(.visible)
                    
                    HistoryView()
                        .tag(NavigationTab.history)
                        .toolbar(.visible)
                    
                    SummaryView()
                        .tag(NavigationTab.summary)
                        .toolbar(.visible)
                    
                    SettingView()
                        .tag(NavigationTab.setting)
                        .toolbar(.visible)
                }
                
                NavigationTabMenu(selectedTab: $navigationCenter.selectedTab) { tab in
                    if tab == .create {
                        navigationCenter.goto(.ADD_TRANSACTION_VIEW)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(24)
            }
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
        .onAppear {
            contentViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
