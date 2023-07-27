//
//  HistoryViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import Foundation

@MainActor
class HistoryViewModel: ObservableObject {
    let txnService = TransactionService.shared
    
    @Published var monthYearField: MonthYearPickerValue { didSet { fetch() } }
    @Published var transaction = Transaction()
    
    init() {
        monthYearField = MonthYearPickerValue(
            Month: Calendar.current.component(.month, from: Date()),
            Year: Calendar.current.component(.year, from: Date()))
        
        fetch()
    }
    
    func fetch() {
        txnService.fetchDate(month: monthYearField.Month, year: monthYearField.Year) { txn in
            DispatchQueue.main.async {
                self.transaction = txn
            }
        }
    }
}
