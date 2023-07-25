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
    
    let txnService = TransactionService.shared
    
//    @Published var month: Int
//    @Published var monthSelectionField: DropdownOption?
    @Published var transaction = Transaction()
    
    init() {
//        month = Calendar.current.component(.month, from: Date())
//        monthSelectionField = monthOptions[month - 1]
        fetch()
    }
    
    func fetch() {
//        let arr = monthSelectionField?.OptionId.components(separatedBy: ".")
//        let m = Int(arr![0]) ?? month
//        let y = Int(arr![1]) ?? 2023
        let m = 7, y = 2023
        
        txnService.fetchDate(month: m, year: y) { txn in
            self.transaction = txn
        }
    }
}
