//
//  WalletSettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

struct WalletSettingView: View {
    @EnvironmentObject private var contentViewModel: ContentViewModel
    
    var body: some View {
        SettingList {
            ForEach(contentViewModel.wallet.getWallet(),
                    id: \.WalletId) { wallet in

                SettingNavigationLink(label: wallet.Label) {
                    WalletEditorView(wallet: wallet)
                }
            }
        }
        .onAppear {
            contentViewModel.fetchWallet()
        }
        
        NavigationLink {
            
        } label: {
            Text("+ Wallet").foregroundColor(Color.gray)
        }
        .padding(12)
    }
}

struct WalletSettingView_Previews: PreviewProvider {
    @StateObject static var viewModel = ContentViewModel()
    static var previews: some View {
        NavigationStack {
            ContentTemplate {
                WalletSettingView()
                    .environmentObject(viewModel)
            }
        }
    }
}
