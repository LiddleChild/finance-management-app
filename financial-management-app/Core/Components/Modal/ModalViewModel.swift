//
//  modalViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

@MainActor
class ModalViewModel: ObservableObject {
    struct Return {
        var yesNoQuestion: Bool?
    }
    
    enum ModalType {
        case Alert, YesNoQuestion
    }
    
    static let shared = ModalViewModel()
    private init() { }
    
    private let animationDuration = 0.25
    
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var symbol: String = ""
    @Published var symbolColor: Color = .green
    @Published var isShowing: Bool = false
    @Published var modalType: ModalType = .Alert
    @Published var completion: (Return) -> Void = { _ in }
    
    func alertSuccess(duration: Double = 2,
                      title: String = "Success",
                      message: String = "",
                      completion: @escaping () -> Void = {}) {
        
        self.modalType = .Alert
        self.symbolColor = symbolColor
        self.title = title
        self.message = message
        self.symbol = "checkmark.circle.fill"
        self.symbolColor = .green
        
        show()
        hide(after: duration, completion: completion)
    }
    
    func alertFailure(duration: Double = 2,
                      title: String = "Failure",
                      message: String = "",
                      completion: @escaping () -> Void = {}) {
        
        self.modalType = .Alert
        self.symbolColor = symbolColor
        self.title = title
        self.message = message
        self.symbol = "xmark.circle.fill"
        self.symbolColor = .red
        
        show()
        hide(after: duration, completion: completion)
    }
    
    func yesNoQuestion(title: String,
                       message: String,
                       completion: @escaping (Bool) -> Void) {
        
        self.modalType = .YesNoQuestion
        self.symbolColor = symbolColor
        self.title = title
        self.message = message
        self.symbol = "questionmark.circle.fill"
        self.symbolColor = .blue
        self.completion = { value in
            self.hide()
            completion(value.yesNoQuestion!)
        }
        
        show()
    }
    
    private func show() {
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: self.animationDuration)) {
                self.isShowing = true
            }
        }
    }
    
    private func hide() {
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: self.animationDuration)) {
                self.isShowing = false
            }
        }
    }
    
    private func hide(after: Double, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after + animationDuration) {
            withAnimation(.easeInOut(duration: self.animationDuration)) {
                self.isShowing = false
            }
            
            completion()
        }
    }
}
