//
//  ContentView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 14.09.2024.
//

import SwiftUI

struct ContentView: View {
    // Access the AuthViewModel instance
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            if authViewModel.isLoggedIn {
                HomeView()
            } else {
                // Show the login view when not logged in
                LoginView()
            }
        }
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
