//
//  Login.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 14.09.2024.
//

import Foundation

// Define the response model
struct LoginResponse: Codable {
    struct User: Codable {
        let _id: String
        let email: String
        let username: String
        let password: String
        let phoneNumber: String
    }
    let user: User
    let accessToken: String
    let refreshToken: String
}

// Define the login request body
struct LoginRequest: Codable {
    let email: String
    let password: String
}



func login(email: String, password: String) {
    // API URL
    guard let url = URL(string: "https://squid-app-dkgj4.ondigitalocean.app/auth/login") else {
        print("Invalid URL")
        return
    }

    // Create a request object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // Prepare the login request body
    let loginRequest = LoginRequest(email: email, password: password)

    // Encode the request body as JSON
    do {
        let requestBody = try JSONEncoder().encode(loginRequest)
        request.httpBody = requestBody
    } catch {
        print("Error encoding login request: \(error)")
        return
    }

    // Create the data task
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error with fetching login: \(error)")
            return
        }

        // Check if response data is received
        guard let data = data else {
            print("No data received")
            return
        }

        // Decode the response data
        do {
            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            print("User ID: \(loginResponse.user._id)")
            print("Access Token: \(loginResponse.accessToken)")
        } catch {
            print("Error decoding login response: \(error)")
        }
    }.resume() // Don't forget to resume the task!
}
