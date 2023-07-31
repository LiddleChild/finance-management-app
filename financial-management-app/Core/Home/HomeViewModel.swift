//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var transaction = Transaction()
    @Published var todayTransactions: [TransactionModel] = []
    let txnService = TransactionService.shared
    
    @Published var tabSelection: TabItem
    let tabItems = [
        TabItem(Label: "Home", Icon: "house", SelectedIcon: "house.fill"),
        TabItem(Label: "History", Icon: "clock", SelectedIcon: "clock.fill"),
        TabItem(Label: "Create", Icon: "plus.circle", SelectedIcon: "plus.circle.fill"),
        TabItem(Label: "Summary", Icon: "list.bullet.clipboard", SelectedIcon: "list.bullet.clipboard.fill"),
        TabItem(Label: "Setting", Icon: "gearshape", SelectedIcon: "gearshape.fill"),
    ]
    
    init() {
        tabSelection = tabItems[0]
    }
    
    func fetch() {
        txnService.fetch { txn in
            DispatchQueue.main.async {
                self.transaction = txn
            }
        }
        
        txnService.fetchToday { txns in
            DispatchQueue.main.async {
                self.todayTransactions = txns
            }
        }
    }
}
