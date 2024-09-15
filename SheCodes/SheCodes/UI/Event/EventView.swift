import SwiftUI

struct EventView: View {

    @State private var isShowingAddEventAlert = false
    @State private var isShowingHome = false
    @State private var example =  Event(id: "66e5d82ea4b3940950844604",
                                        title: "SHECODES",
                                        description: "SheCodes 3.0 is a great opportunity to improve your IT skills, take part in solving unique cases from our partner companies and receive valuable prizes.",
                                        date: "2024-01-01T15:45:00.000Z",
                                        location: "Astana, NU",
                                        image_location: "shecodes",
                                        owner: Owner(_id: "66e576bd442f261bcfb10609",
                                                     email: "madon@gmail.com",
                                                     username: "madon",
                                                     phoneNumber: "87073393361"))
    @State private var showDetail = false
    let events = [
        Event(id: "66e5d82ea4b3940950844604",
              title: "SHECODES",
              description: "SheCodes 3.0 is a great opportunity to improve your IT skills, take part in solving unique cases from our partner companies and receive valuable prizes.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "shecodes",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        Event(id: "66e592ca86bd9455cd10c3bc",
              title: "Volunteer",
              description: "Join us for an exciting community event where your help is needed! We’re hosting a vibrant festival to celebrate local talent and culture, and we’re looking for enthusiastic volunteers to make it a success. Whether you’re passionate about event planning, enjoy interacting with people, or simply want to lend a hand, your support will be invaluable.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "Volunteer",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e595ce86bd9455cd10c3c5",
              title: "HackNu/24",
              description: "HackNu is a renowned annual hackathon held in Kazakhstan, aimed at fostering innovation and collaboration among tech enthusiasts and developers. It's a platform where participants come together to tackle real-world challenges, develop new technologies, and showcase their skills.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "hacknu",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e5d8fca4b394095084460a",
              title: "Subotnic",
              description: "In the capital, as part of the environmental month 'Zhasyl Astana', a citywide cleanup was held. More than 56 thousand citizens came out to clean Astana of garbage, reports the official website of the city akimat.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "Subotnic",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361")),
        
        Event(id: "66e5d93ea4b394095084460d",
              title: "Volunteer",
              description: "In the capital, as part of the environmental month 'Zhasyl Astana', a citywide cleanup was held. More than 56 thousand citizens came out to clean Astana of garbage, reports the official website of the city akimat.",
              date: "2024-01-01T15:45:00.000Z",
              location: "Astana, NU",
              image_location: "Volunteer",
              owner: Owner(_id: "66e576bd442f261bcfb10609",
                           email: "madon@gmail.com",
                           username: "madon",
                           phoneNumber: "87073393361"))
    ]


    var body: some View {
        if isShowingHome {
            HomeView()
        } else if showDetail{
            EventDetailView(event: example)
        } else {
                ZStack {
                        VStack {
                            // Search Bar
                            HStack {
                                Button {
                                    isShowingHome = true
                                } label: {
                                    Image("back")
                                }
                                Spacer()
                                Text("Events")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                Spacer()
                            }
                            .padding(.horizontal)

                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.purple)
                                    .padding(.leading, 10)

                                TextField("Search for an event", text: .constant(""))
                                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                    .padding(10)
                            }
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            .padding()
                            .padding(.top, 8)

                            // Grid of Event Cards
                            ScrollView {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                    ForEach(events) { event in
                                        Button(action: {
                                            showDetail = true
                                            example = event
                                        }, label: {
                                            CardEventView(event: event)
                                        })
                                       
                                    }
                                }
                                .padding()
                            }

                            // Floating Add Button
                            Button(action: {
                                isShowingAddEventAlert = true
                            }) {
                                Image("Add")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 68, height: 68)
                                    .padding(30)
                            }
                            .frame(width: 80, height: 80)
                        }
                    

                    // Custom Alert Modal...
                    if isShowingAddEventAlert {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()

                        VStack {
                            VStack(alignment: .center, spacing: 20) {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        isShowingAddEventAlert = false // Dismiss the alert
                                    }) {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.purple)
                                            .padding()
                                            .fontWeight(.bold)
                                    }
                                }

                                HStack {
                                    Text("Add New Event")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                }
                                .padding(.horizontal)

                                // Form Fields for New Event
                                EventFormView(isShowingAddEventAlert: $isShowingAddEventAlert)

                                // Submit Button
                                Button(action: {
                                    // Submit the form action
                                    isShowingAddEventAlert = false // Dismiss the alert after submission
                                }) {
                                    Text("Submit")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(30)
                                        .padding(.horizontal, 45)
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.horizontal, 40)
                            .shadow(radius: 10)
                        }
                        .transition(.opacity) // Animation for showing and hiding
                        .animation(.easeInOut, value: isShowingAddEventAlert)
                    }
                }
            
        }
    }
}

struct EventFormView: View {
    @Binding var isShowingAddEventAlert: Bool
    @State private var eventName = ""
    @State private var eventLocation = ""
    @State private var eventDescription = ""
    @State private var eventImage = ""

    var body: some View {
        VStack {
            HStack {
                Text("Event Name")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                Spacer()
            }
            TextField("Enter event name", text: $eventName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .foregroundColor(Color.purple)
                .padding(.horizontal, 16)

            HStack {
                Text("Location")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                Spacer()
            }
            TextField("Enter location", text: $eventLocation)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .foregroundColor(Color.purple)
                .padding(.horizontal, 16)

            HStack {
                Text("Description")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                Spacer()
            }
            TextField("Enter description", text: $eventDescription)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .foregroundColor(Color.purple)
                .padding(.horizontal, 16)

            HStack {
                Text("Image URL")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                Spacer()
            }
            TextField("Enter image URL", text: $eventImage)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .foregroundColor(Color.purple)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    EventView()
}
