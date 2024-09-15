//
//  SheCodesApp.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 14.09.2024.
//

import SwiftUI

@main

struct SheCodesApp: App {
    // Create a shared instance of AuthViewModel
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel) // Inject AuthViewModel into the environment
        }
    }
}
