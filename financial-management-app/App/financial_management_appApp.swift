//
//  financial_management_appApp.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.
//

import SwiftUI

@main
struct financial_management_appApp: App {
    @StateObject var txnViewModel = TxnViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(txnViewModel)
                .environmentObject(categoryViewModel)
        }
    }
}
