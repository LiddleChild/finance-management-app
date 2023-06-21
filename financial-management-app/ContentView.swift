//
//  ContentView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.a
//

// TODO: explore Navigation Stuff

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle()
            .fill(Color("color-1"))
            .ignoresSafeArea()
    }
}

struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Good\nEvening!")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("color-5"))
                .padding(.bottom, 8)
            
            Text("Sign in to your Account")
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Color("color-5"))
        }
    }
}

struct FormView: View {
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    var body: some View {
        VStack(alignment: .trailing) {
            CustomTextField(label: "Email", placeholder: "example@mail.com", text: $emailField)
            CustomSecureField(label: "Password", placeholder: "********", text: $passwordField)
            
            CustomSecondaryButton(label: "Forgot Password?") {
                print("Forgot password?")
            }
            .padding(.bottom)
            
            CustomPrimaryButton(label: "Login") {
                print("Email: \(emailField)\nPassword: \(passwordField)")
            }
            
            HStack {
                Text("New here?")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color("color-5"))
                
                CustomSecondaryButton(label: "Create an Account") {
                    print("Register")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    HeadingView()
                    
                    Spacer()

                    FormView()
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
