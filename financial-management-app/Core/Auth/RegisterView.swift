//
//  RegisterView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import SwiftUI

private struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create your Account")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color("color-5"))
                .padding(.bottom, 8)
            
            Text("Please fill your information")
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Color("color-5"))
        }
    }
}

private struct FormView: View {
    @State var nameField: String = ""
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Name
            TextField("", text: $nameField)
                .autocapitalization(.none)
                .modifier(
                    TextfieldModifier(label: "Name", placeholder: "Gaben Newell", text: nameField))
            
            // Email
            TextField("", text: $emailField)
                .autocapitalization(.none)
                .modifier(
                    TextfieldModifier(label: "Email", placeholder: "exmaple@mail.com", text: emailField))
            
            // Password
            SecureField("", text: $passwordField)
                .modifier(
                    TextfieldModifier(label: "Password", placeholder: "********", text: passwordField))
        }
    }
}

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HeadingView()
                    .padding(.bottom, 64)
                
                // Textfields
                FormView()
                    .padding(.bottom, 64)
                
                // Login Button
                Button {
                    print("Create account")
                } label: {
                    Text("Create Account").modifier(PrimaryButtonModifier())
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
