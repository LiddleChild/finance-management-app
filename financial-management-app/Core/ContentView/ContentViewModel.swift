//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import SwiftUI

@MainActor
class ContentViewModel: ObservableObject {
    enum Status { case Loading, Connection, NoConnection }
    let statusService = StatusService.shared
    @Published var status: Status = .Loading
    
    init() {
        ping()
    }
    
    func ping() {
        statusService.ping { err in
            DispatchQueue.main.async {
                self.status = err == nil ? .Connection : .NoConnection
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                if self.status == .NoConnection {
                    self.ping()
                }
            }
        }
    }
}
