//
//  modalViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

@MainActor
class ModalViewModel: ObservableObject {
    static let shared = ModalViewModel()
    private init() { }
    
    private let animationDuration = 0.25
    
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var symbol: String = ""
    @Published var symbolColor: Color = .green
    @Published var isShowing: Bool = false
    
    func alertSuccess(duration: Double = 2,
                      title: String = "Success",
                      message: String = "",
                      completion: @escaping () -> Void = {}) {
        
        alert(duration: duration,
              title: title,
              message: message,
              symbol: "checkmark.circle.fill",
              symbolColor: .green,
              completion: completion)
    }
    
    func alertFailure(duration: Double = 2,
                      title: String = "Failure",
                      message: String = "",
                      completion: @escaping () -> Void = {}) {
        
        alert(duration: duration,
              title: title,
              message: message,
              symbol: "xmark.circle.fill",
              symbolColor: .red,
              completion: completion)
    }
    
    private func alert(duration: Double,
                       title: String,
                       message: String,
                       symbol: String,
                       symbolColor: Color,
                       completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            self.symbolColor = symbolColor
            self.title = title
            self.message = message
            self.symbol = symbol
            
            withAnimation(.easeInOut(duration: self.animationDuration)) {
                self.isShowing = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration + animationDuration) {
            withAnimation(.easeInOut(duration: self.animationDuration)) {
                self.isShowing = false
            }
            
            completion()
        }
    }
}
