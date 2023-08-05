//
//  Alert.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

struct ModalAlert: View {
    var title: String
    var message: String
    var symbol: String
    var symbolColor: Color
    
    var body: some View {
        Image(systemName: symbol)
            .resizable()
            .frame(width: 64, height: 64)
            .foregroundColor(symbolColor)
            .scaledToFill()
        
        Text(verbatim: title)
            .foregroundColor(.black)
            .font(.system(size: 28, weight: .semibold))
        
        Text(verbatim: message)
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .regular))
            .multilineTextAlignment(.leading)
    }
}

struct ModalAlert_Previews: PreviewProvider {
    private static let width = UIScreen.main.bounds.width
    static var previews: some View {
        VStack {
            ModalAlert(
                title: "Title",
                message: "Message",
                symbol: "checkmark.circle.fill",
                symbolColor: .green)
        }
        .padding(32)
        .foregroundColor(.black)
        .frame(width: width, height: width)
        .background {
            RoundedRectangle(cornerRadius: 36)
                .foregroundColor(Color.color5)
        }
    }
}
