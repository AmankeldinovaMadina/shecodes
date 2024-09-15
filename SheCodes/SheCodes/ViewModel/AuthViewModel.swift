import SwiftUI
import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var accessToken: String? {
        didSet {
            // Whenever the accessToken changes, store it in UserDefaults
            if let token = accessToken {
                UserDefaults.standard.set(token, forKey: "accessToken")
            } else {
                UserDefaults.standard.removeObject(forKey: "accessToken")
            }
        }
    }
    
    init() {
        // When the view model is initialized, check if a token is stored
        if let storedToken = UserDefaults.standard.string(forKey: "accessToken") {
            self.accessToken = storedToken
            self.isLoggedIn = true
            print("Restored access token from UserDefaults")
        }
    }
    
    // Function to perform the login request
    func login(email: String, password: String) {
        guard let url = URL(string: "https://squid-app-dkgj4.ondigitalocean.app/auth/login") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let loginRequest = LoginRequest(email: email, password: password)

        do {
            let requestBody = try JSONEncoder().encode(loginRequest)
            request.httpBody = requestBody
        } catch {
            print("Error encoding login request: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with login: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                
                // Update the authentication state on the main thread
                DispatchQueue.main.async {
                    self.accessToken = loginResponse.accessToken
                    self.isLoggedIn = true
                    print("Successfully logged in: \(loginResponse.user.username)")
                }
            } catch {
                print("Error decoding login response: \(error)")
            }
        }.resume()
    }
    
    func logout() {
        // Remove the token from UserDefaults and update the logged-in state
        self.accessToken = nil
        self.isLoggedIn = false
        print("Logged out, token removed from UserDefaults")
    }
}
