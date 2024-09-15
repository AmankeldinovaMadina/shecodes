import Foundation
import SwiftUI

class PetViewModel: ObservableObject {
    @Published var pets: [Pet] = []

    func fetchPets() {
        guard let url = URL(string: "https://squid-app-dkgj4.ondigitalocean.app/all/pets") else {
            print("Invalid URL")
            return
        }

        // Retrieve token from UserDefaults
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {
            print("No access token found")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add authorization token dynamically
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        print("Sending request to URL: \(url)")
        print("Authorization: Bearer \(accessToken)")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Received HTTP response: \(httpResponse.statusCode)")
            }

            if let error = error {
                print("Error fetching pets: \(error)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            // Print the received data (optional)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received data: \(jsonString)")
            }

            // Decode the data into the Pet model
            do {
                let pets = try JSONDecoder().decode([Pet].self, from: data)

                // Update UI on the main thread
                DispatchQueue.main.async {
                    self.pets = pets
                    print("Pets successfully decoded and published.")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
