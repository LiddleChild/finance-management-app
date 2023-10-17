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
        NavigationStack {
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
                    
                    NavigationTabMenu(selectedTab: $navigationCenter.selectedTab) {
                        AddTransactionView().modifier(NagivationDismissModier())
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 44)
                }
            }
            .toolbar(.visible)
            .ignoresSafeArea()
            .overlay(Modal())
        }
        .environmentObject(mainViewModel)
        .environmentObject(modalViewModel)
        .environmentObject(navigationCenter)
        .navigationDestination(for: ViewLists.self) { view in
            switch (view) {
            case ViewLists.ADD_TRANSACTION_VIEW:
                AddTransactionView()
            
            case ViewLists.ADD_DETAIL_VIEW:
                AddDetailView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
