//
//  WalletSettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

struct WalletSettingView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            SettingList {
                if (viewModel.wallet.getWallet().isEmpty) {
                    Text("No wallet found.")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16))
                        .foregroundColor(Color.color5)
                } else {
                    ForEach(viewModel.wallet.getWallet(),
                            id: \.WalletId) { wallet in
                        
                        SettingNavigationLink(label: wallet.Label) {
                            WalletEditorView(wallet: wallet)
                        }
                    }
                }
            }
            
            NavigationLink {
                WalletCreatingView()
            } label: {
                Text("+ Wallet")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 16))
            }
            .padding(8)
        }
        .onAppear {
            viewModel.fetchWallet()
        }
    }
}

struct WalletSettingView_Previews: PreviewProvider {
    @StateObject static var viewModel = MainViewModel()
    static var previews: some View {
        NavigationStack {
            ContentTemplate {
                WalletSettingView()
                    .environmentObject(viewModel)
            }
        }
    }
}
