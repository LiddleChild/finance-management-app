//
//  RegisterView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import SwiftUI

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
        ContentTemplate {
            VStack(alignment: .leading, spacing: 20) {
                HeaderView(header: "Create your Account", subheader: "Please fill your information")
                    .padding(.bottom, 64)
                
                // Textfields
                FormView()
                    .padding(.bottom, 64)
                
                // Login Button
                Button {
                    print("Create account")
                } label: {
                    Text("Create Account")
                        .modifier(PrimaryButtonModifier())
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
