//
//  ModalYesNoQuestion.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

struct ModalYesNoQuestion: View {
    var title: String
    var message: String
    var symbol: String
    var symbolColor: Color
    
    var completion: (Bool) -> Void
    
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
        
        Spacer()
        
        Button {
            completion(true)
        } label: {
            Text("Yes")
                .font(.system(size: 20, weight: .regular))
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.white))
        }
        
        Button {
            completion(false)
        } label: {
            Text("No")
                .font(.system(size: 20, weight: .regular))
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.white))
        }
    }
}

struct ModalYesNoQuestion_Previews: PreviewProvider {
    private static let width = UIScreen.main.bounds.width
    static var previews: some View {
        VStack {
            ModalYesNoQuestion(
                title: "Title",
                message: "Message",
                symbol: "questionmark.circle.fill",
                symbolColor: .blue) { choice in
                    print(choice)
                }
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
