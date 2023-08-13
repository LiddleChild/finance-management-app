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
        NavigationStack {
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
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationTabMenu(selectedTab: $navigationCenter.selectedTab) {
                        AddTransactionView().modifier(NagivationDismissModier())
                    }
                    .padding(.bottom, 44)
                }
            }
            .overlay(Modal())
            .environmentObject(contentViewModel)
            .environmentObject(modalViewModel)
            .environmentObject(navigationCenter)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
