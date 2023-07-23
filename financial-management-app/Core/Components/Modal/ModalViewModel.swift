//
//  modalViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

class ModalViewModel: ObservableObject {
    static let shared = ModalViewModel()
    private init() { }
    
    @Published var message: String = ""
    @Published var symbol: String = ""
    @Published var symbolColor: Color = .green
    @Published var isShowing: Bool = false
    
    func alertSuccess(duration: Double = 1.5,
                      message: String = "Success!",
                      completion: @escaping () -> Void = {}) {
        
        alert(duration: duration,
              message: message,
              symbol: "checkmark.circle.fill",
              symbolColor: .green,
              completion: completion)
    }
    
    func alertFailure(duration: Double = 1.5,
                      message: String = "Failure!",
                      completion: @escaping () -> Void = {}) {
        
        alert(duration: duration,
              message: message,
              symbol: "xmark.circle.fill",
              symbolColor: .red,
              completion: completion)
    }
    
    private func alert(duration: Double,
                       message: String,
                       symbol: String,
                       symbolColor: Color,
                       completion: @escaping () -> Void) {
        
        self.symbolColor = symbolColor
        self.message = message
        self.symbol = symbol
        withAnimation(.easeIn) { self.isShowing = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation(.easeOut) { self.isShowing = false }
            completion()
        }
    }
}
