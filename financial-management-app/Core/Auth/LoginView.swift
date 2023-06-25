//
//  LoginView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import SwiftUI

private struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Good Evening!")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color("color-5"))
                .padding(.bottom, 8)
            
            Text("Sign in to your Account")
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Color("color-5"))
        }
    }
}

private struct FormView: View {
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            // Email
            TextField("", text: $emailField)
                .autocapitalization(.none)
                .modifier(
                    TextfieldModifier(label: "Email", placeholder: "exmaple@mail.com", text: emailField))
            
            // Password
            SecureField("", text: $passwordField)
                .modifier(
                    TextfieldModifier(label: "Password", placeholder: "********", text: passwordField))
            
            // Forgot Password
            Button() {
                print("Forgot password?")
            } label: {
                Text("Forgot Password?").modifier(SecondaryButtonModifier())
            }
            
            // Login
            Button {
                print("Login")
            } label: {
                Text("Login").modifier(PrimaryButtonModifier())
            }
            
            HStack {
                Text("New here?")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("color-5"))
                
                NavigationLink {
                    RegisterView()
                        .modifier(NagivationDismissModier())
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Create an Account").modifier(SecondaryButtonModifier())
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct LoginView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("color-1"))
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HeadingView()
                        .padding(.bottom, 128)
                    
                    FormView()
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
