//
//  HistoryViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import Foundation

class HistoryViewModel: ObservableObject {
    let monthOptions: [DropdownOption] = [
        DropdownOption(OptionId: "1.2023", Label: "January 2023"),
        DropdownOption(OptionId: "2.2023", Label: "February 2023"),
        DropdownOption(OptionId: "3.2023", Label: "March 2023"),
        DropdownOption(OptionId: "4.2023", Label: "April 2023"),
        DropdownOption(OptionId: "5.2023", Label: "May 2023"),
        DropdownOption(OptionId: "6.2023", Label: "June 2023"),
        DropdownOption(OptionId: "7.2023", Label: "July 2023"),
        DropdownOption(OptionId: "8.2023", Label: "August 2023"),
        DropdownOption(OptionId: "9.2023", Label: "September 2023"),
        DropdownOption(OptionId: "10.2023", Label: "October 2023"),
        DropdownOption(OptionId: "11.2023", Label: "November 2023"),
        DropdownOption(OptionId: "12.2023", Label: "December 2023"),
    ]
    
    let txnService = TxnService()
    
    @Published var month: Int
    @Published var monthSelectionField: DropdownOption? {
        didSet {
            fetchDate()
        }
    }
    
    @Published var dayTxns: [DayTxnModel] = []
    
    init() {
        month = Calendar.current.component(.month, from: Date())
        monthSelectionField = monthOptions[month - 1]
    }
    
    func fetchDate() {
        let arr = monthSelectionField?.OptionId.components(separatedBy: ".")
        let m = Int(arr![0]) ?? month
        let y = Int(arr![1]) ?? 2023
        
        txnService.fetchDate(month: m, year: y) { txns in
            self.dayTxns = self.getDayTransaction(txns: txns ?? [])
        }
    }
    
    func getDayTransaction(txns: [TxnModel]) -> [DayTxnModel] {
        var dict: [Int64: [TxnModel]] = [:]
        var dayTxn: [DayTxnModel] = []

        for txn in txns {
            let key = txn.Timestamp - txn.Timestamp % (60 * 60 * 24)

            var tmp = dict[key] ?? []
            tmp.append(txn)
            dict[key] = tmp
        }

        for key in dict.keys.sorted(by: >) {
            dayTxn.append(.init(Timestamp: key, Transactions: dict[key]!))
        }
        
        return dayTxn
    }
}
