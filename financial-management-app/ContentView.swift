//
//  ContentView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.a
//

import SwiftUI

struct CustomTextField: View {
    var label: String
    var placeholder: String
    
    @State private var isFocus: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("", text: $text) { (status) in
                //
                isFocus.toggle()
            } onCommit: {
                //
            }
            .autocapitalization(.none)
            .foregroundColor(Color("color-5"))
            .padding()
            .background(
                ZStack(alignment: .leading) {
                    // Border
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color("color-\(isFocus ? 4 : 3)"))
                    
                    // Label
                    Text(label)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.horizontal, 4)
                        .foregroundColor(Color("color-5"))
                        .background(Color("color-1"))
                        .offset(x: 16, y: -28)

                    // Placeholder
                    if !isFocus || (isFocus && text == "") {
                        Text(verbatim: placeholder)
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color("color-3"))
                            .padding(16)
                    }
                }
            )
            .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                CustomTextField(label: "Email", placeholder: "example@mail.com")
                CustomTextField(label: "Password", placeholder: "********")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
