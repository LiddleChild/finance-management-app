//
//  SettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 1/8/2566 BE.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var contentViewModel: ContentViewModel
    
    var body: some View {
        ContentTemplate {
            HeaderView(header: "Setting")
            
            SettingList {
                SettingNavigationLink(label: "Wallets") {
                    WalletSettingView()
                }
                
                SettingNavigationLink(label: "Categories") {
                    CategorySettingView()
                }
            }
            
            Spacer()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    @StateObject private static var contentViewModel = MainViewModel()
    static var previews: some View {
        NavigationStack {
            SettingView()
                .toolbar(.visible)
        }
        .environmentObject(contentViewModel)
    }
}
