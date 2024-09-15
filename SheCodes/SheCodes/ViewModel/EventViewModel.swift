import SwiftUI

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var isLoading = false
    @Published var error: String?

    func fetchEvents() {
        print("Starting fetchEvents...")
        
        guard let url = URL(string: "https://yourapi.com/all/events") else {
            self.error = "Invalid URL"
            print("Invalid URL error.")
            return
        }
        
        print("URL is valid: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Set the authorization header (replace YOUR_AUTH_TOKEN with the actual token)
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        print("Authorization header set.")

        isLoading = true
        print("isLoading set to true. Starting data task...")

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                print("Data task finished. isLoading set to false.")

                if let error = error {
                    self.error = "Error: \(error.localizedDescription)"
                    print("Error encountered: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    self.error = "No data received"
                    print("No data received from server.")
                    return
                }

                // Step 1: Print raw JSON response
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(dataString)")
                }

                do {
                    // Step 2: Try decoding the JSON to a dictionary first
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("JSON object successfully decoded: \(jsonObject)")
                    }

                    // Decode the response JSON into Event array
                    print("Attempting to decode JSON into Event model...")
                    let eventsResponse = try JSONDecoder().decode([Event].self, from: data)
                    self.events = eventsResponse
                    print("Events successfully decoded. Number of events: \(self.events.count)")
                } catch {
                    self.error = "Decoding error: \(error.localizedDescription)"
                    print("Decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
        
        print("Data task resumed.")
    }
}
