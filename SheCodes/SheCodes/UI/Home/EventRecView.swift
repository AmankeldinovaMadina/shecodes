//
//  EventRecView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//


import SwiftUI


struct EventRecView: View {
    // Updated events data
    let events = [
        Event(id: "66e5d82ea4b3940950844604",
              title: "SHECODES",
              description: "SheCodes 3.0 is a great opportunity to improve your IT skills, take part in solving unique cases from our partner companies and receive valuable prizes.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/c4a67215-61ab-43de-a8f8-9712d0497e7c-undefined",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        Event(id: "66e592ca86bd9455cd10c3bc",
              title: "Volunteer",
              description: "Join us for an exciting community event where your help is needed! We’re hosting a vibrant festival to celebrate local talent and culture, and we’re looking for enthusiastic volunteers to make it a success. Whether you’re passionate about event planning, enjoy interacting with people, or simply want to lend a hand, your support will be invaluable.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/b44f1d3b-9036-42f8-8fcf-d6f03b9d7c7f-undefined",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e595ce86bd9455cd10c3c5",
              title: "HackNu/24",
              description: "HackNu is a renowned annual hackathon held in Kazakhstan, aimed at fostering innovation and collaboration among tech enthusiasts and developers. It's a platform where participants come together to tackle real-world challenges, develop new technologies, and showcase their skills.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/a9dbeaaf-f444-47e8-bbf0-d53f01edb4e1-undefined",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e5d8fca4b394095084460a",
              title: "Subotnic",
              description: "In the capital, as part of the environmental month 'Zhasyl Astana', a citywide cleanup was held. More than 56 thousand citizens came out to clean Astana of garbage, reports the official website of the city akimat.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/fe5e8c1d-c53b-4e12-a946-9357a974d7f6-undefined",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e5d93ea4b394095084460d",
              title: "Volunteer",
              description: "In the capital, as part of the environmental month 'Zhasyl Astana', a citywide cleanup was held. More than 56 thousand citizens came out to clean Astana of garbage, reports the official website of the city akimat.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/cbf45866-9015-4c4e-a06c-777a4e83cdfa-undefined",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361"))
    ]

    @State private var selectedEventIndex = 0 // Tracks the currently displayed event
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Recommendation Event")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
                .padding(.leading, 16)
            
            // Event cards inside a TabView for swiping
            TabView(selection: $selectedEventIndex) {
                ForEach(0..<events.count) { index in
                    EventCardView(event: events[index])
                        .tag(index) // Tag to track the current index
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Disable default pagination dots
            .frame(height: 300)
            .padding(.horizontal)
            
            // Custom Pagination Dots (indicator)
            HStack {
                Spacer()
                ForEach(0..<events.count) { index in
                    Circle()
                        .fill(index == selectedEventIndex ? Color.gray : Color.gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut, value: selectedEventIndex)
                }
                Spacer()
            }
            .padding(.top, 8)
        }
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    EventRecView()
}
