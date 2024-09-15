//  EventDetailView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct EventDetailView: View {
    @State private var isShowingHome = false
    var event: Event
    
    var body: some View {
        if isShowingHome {
            EventView()
        } else {
            VStack {
                // Back button and header
                HStack {
                    Button {
                        isShowingHome = true
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.purple)
                    }
                    Spacer()
                    Text("Event")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(hex: "873399"))
                    Spacer()
                }
                .padding(.horizontal)
                
                // Event image
                Image(event.image_location) // Removed extra parenthesis
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 270)
                    .cornerRadius(10)
                    .clipped()
                
                // Event title
                Text(event.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(.top, 16)
                
                // Event description and details
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image("star")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.yellow)
                        Text(event.description)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image("location")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                        Text(event.location)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image("time")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.green)
                        Text(formattedDate(from: event.date))
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                Spacer()
                
                // Action button (e.g., to sign up for the event)
                Button(action: {
                    // Handle action, e.g., volunteering, signing up, etc.
                }) {
                    Text("Sign Up for Event")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                        .padding(.horizontal, 45)
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 20)
        }
    }
    
    // Function to format the ISO date string into a more human-readable format
    func formattedDate(from isoDateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: isoDateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        return "Invalid Date"
    }
}

#Preview {
    EventDetailView(event: Event(id: "66e5d82ea4b3940950844604",
                                 title: "SHECODES",
                                 description: "SheCodes 3.0 is a great opportunity to improve your IT skills, take part in solving unique cases from our partner companies and receive valuable prizes.",
                                 date: "2024-01-01T15:45:00.000Z",
                                 location: "Astana, NU",
                                 image_location: "shecodes",
                                 owner: Owner(_id: "66e576bd442f261bcfb10609",
                                              email: "madon@gmail.com",
                                              username: "madon",
                                              phoneNumber: "87073393361")))
}
