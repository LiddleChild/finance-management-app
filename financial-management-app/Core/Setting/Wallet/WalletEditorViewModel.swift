//
//  WalletEditorViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

@MainActor
class WalletEditorViewModel: ObservableObject {
    @Published var labelField: String = ""
    @Published var colorField: Color = .white
    
    func doesChange(_ wallet: WalletModel) -> Bool {
        return (labelField != "" && labelField != wallet.Label) || colorField != Color(hex: wallet.Color)
    }
    
    func patch() {
        
    }
}
