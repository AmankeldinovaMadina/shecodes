//
//  AuthView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 14.09.2024.
//

import SwiftUI


struct LoginView: View {
    // State variables for the input fields
    @State private var email: String = ""
    @State private var password: String = ""
    
    // Add an instance of the AuthViewModel to the view
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 20)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 40)
            
            Button(action: {
                // Call the login function in AuthViewModel
                authViewModel.login(email: email, password: password)
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

