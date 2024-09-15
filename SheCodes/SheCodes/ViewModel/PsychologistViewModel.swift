//
//  PsychologistViewModel.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import Foundation
import SwiftUI

class PsychologistViewModel: ObservableObject {
    @Published var psychologists: [Psychologist] = []

    func fetchPsychologists() {
        guard let url = URL(string: "https://squid-app-dkgj4.ondigitalocean.app/all/psychologists") else {
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
        
        // Add authorization token to the request
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        print("Sending request to URL: \(url)")
        print("Authorization: Bearer \(accessToken)")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Received HTTP response: \(httpResponse.statusCode)")
            }

            if let error = error {
                print("Error fetching psychologists: \(error)")
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

            // Decode the data into the Psychologist model
            do {
                let psychologists = try JSONDecoder().decode([Psychologist].self, from: data)

                // Update UI on the main thread
                DispatchQueue.main.async {
                    self.psychologists = psychologists
                    print("Psychologists successfully decoded and published.")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
