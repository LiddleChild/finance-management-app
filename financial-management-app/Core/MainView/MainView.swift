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
    @StateObject private var mainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationCenter.path) {
            ZStack {
                TabView(selection: $navigationCenter.selectedTab) {
                    HomeView()
                        .tag(NavigationTab.home)
                    
                    AddTransactionView()
                        .tag(NavigationTab.create)
                    
                    SettingView()
                        .tag(NavigationTab.setting)
                }
                
                VStack {
                    Spacer()
                    
                    NavigationTabMenu(selectedTab: $navigationCenter.selectedTab)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 44)
                }
            }
            .navigationDestination(for: ViewLists.self) { destination in
                switch (destination) {
                case ViewLists.ADD_TRANSACTION_VIEW:
                    AddTransactionView().modifier(NagivationDismissModier())
                    
                case ViewLists.ADD_DETAIL_VIEW:
                    AddDetailView().modifier(NagivationDismissModier())
                }
            }
            .toolbar(.visible)
            .ignoresSafeArea()
        }
        .environmentObject(mainViewModel)
        .environmentObject(modalViewModel)
        .environmentObject(navigationCenter)
        .overlay(Modal())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
