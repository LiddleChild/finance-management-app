//
//  SettingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 1/8/2566 BE.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                HeaderView(header: "Setting")
                
                SettingList {
                    SettingNavigationLink(label: "Wallets") {
                        
                    }
                    
                    SettingNavigationLink(label: "Categories") {
                        
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingView()
                .toolbar(.visible, for: .navigationBar)
        }
    }
}
