import SwiftUI


struct BookView: View {

    @State private var isShowingAddEventAlert = false
    @State private var isShowingHome = false
    @State private var example = BookClub(
        id: "66e670711f78335d8eca0234",
        name: "Astana Book Club",
        description: "A book club is a gathering of people who come together to discuss a shared passion for reading...",
        location: "Astana NU",
        memberCount: 15,
        imageLocation: "https://mybucketkam.s3.eu-north-1.amazonaws.com/ac066af0-2e68-4934-89ec-05dae9f32cc0-Astana%20Book%20Club",
        currentBook: "Harry Potter Prt 5",
        currentBookImage: "https://mybucketkam.s3.eu-north-1.amazonaws.com/6cc5c653-959b-45cd-a39d-24051a806cf1-Harry%20Potter%20Prt%205"
    )
    @State private var showDetail = false
    
    let bookClubsOnline: [BookClub] = [
        BookClub(
            id: "66e671f21f78335d8eca0236",
            name: "Book Club",
            description: "A book club is a gathering of people who come together to discuss a shared passion for reading...",
            location: "Online",
            memberCount: 15,
            imageLocation: "https://mybucketkam.s3.eu-north-1.amazonaws.com/95e80bf0-93cf-4e13-94af-caad558e4be1-Book%20Club",
            currentBook: "O divny mir",
            currentBookImage: "https://mybucketkam.s3.eu-north-1.amazonaws.com/1661633b-cc49-49e5-873a-50e19bc0c9ce-O%20divny%20mir"
        ),
        BookClub(
            id: "66e674841f78335d8eca023a",
            name: "NUR Book Club",
            description: "A book club is a gathering of people who come together to discuss a shared passion for reading...",
            location: "Online",
            memberCount: 25,
            imageLocation: "https://mybucketkam.s3.eu-north-1.amazonaws.com/ae4c2be6-1b55-41fa-9128-dcd05017867f-NUR%20Book%20Club",
            currentBook: "Abai Zholy",
            currentBookImage: "https://mybucketkam.s3.eu-north-1.amazonaws.com/30462ffd-ad38-45cb-ad12-4cde7abe735b-Abai%20Zholy"
        )
    ]
    
    let bookClubsOffline: [BookClub] = [
        BookClub(
            id: "66e670711f78335d8eca0234",
            name: "Astana Book Club",
            description: "A book club is a gathering of people who come together to discuss a shared passion for reading...",
            location: "Astana NU",
            memberCount: 15,
            imageLocation: "https://mybucketkam.s3.eu-north-1.amazonaws.com/ac066af0-2e68-4934-89ec-05dae9f32cc0-Astana%20Book%20Club",
            currentBook: "Harry Potter Prt 5",
            currentBookImage: "https://mybucketkam.s3.eu-north-1.amazonaws.com/6cc5c653-959b-45cd-a39d-24051a806cf1-Harry%20Potter%20Prt%205"
        ),
        BookClub(
            id: "66e6745c1f78335d8eca0238",
            name: "NUR Book Club",
            description: "A book club is a gathering of people who come together to discuss a shared passion for reading...",
            location: "Astana",
            memberCount: 16,
            imageLocation: "https://mybucketkam.s3.eu-north-1.amazonaws.com/256528a2-982f-4dab-8061-834ef799b4f8-NUR%20Book%20Club",
            currentBook: "Abai Zholy",
            currentBookImage: "https://mybucketkam.s3.eu-north-1.amazonaws.com/ee82586f-cd90-4370-ac19-002ca67ab775-Abai%20Zholy"
        )
    ]

    var body: some View {
        if isShowingHome {
            HomeView()
        } else if showDetail {
            BookDetailView()
        } else {
            ZStack {
                VStack {
                    // Navigation Bar
                    HStack {
                        Button {
                            isShowingHome = true
                        } label: {
                            Image(systemName: "arrow.left")
                        }
                        Spacer()
                        Text("Book")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.purple)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.purple)
                            .padding(.leading, 10)
                        TextField("Search for a book club", text: .constant(""))
                            .foregroundColor(.purple)
                            .padding(10)
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Online Book Clubs
                            Text("Online")
                                .font(.headline)
                                .padding(.leading)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(bookClubsOnline) { book in
                                    Button(action: {
                                        showDetail = true
                                        example = book
                                    }) {
                                        BookCardView()
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 150)
                            // Offline Book Clubs
                            Text("Offline")
                                .font(.headline)
                                .padding(.leading)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(bookClubsOffline) { book in
                                    Button(action: {
                                        showDetail = true
                                        example = book
                                    }) {
                                        BookCardView()
                                            .padding(.trailing)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 16)
                    
                    Spacer()

                    // Floating Add Button
                    Button(action: {
                        isShowingAddEventAlert = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 68, height: 68)
                            .foregroundColor(.purple)
                            .padding(30)
                    }
                    .frame(width: 80, height: 80)
                }

                // Custom Alert Modal
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
                            Text("Kitap klubyn qosu")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.purple)

                            // Form Fields for New Event
                            BookFormView(isShowingAddEventAlert: $isShowingAddEventAlert)

                            // Submit Button
                            Button(action: {
                                isShowingAddEventAlert = false // Dismiss the alert after submission
                            }) {
                                Text("Jiberu")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(30)
                                    .padding(.horizontal, 45)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .padding(.horizontal, 40)
                        .shadow(radius: 10)
                    }
                    .transition(.opacity)
                    .animation(.easeInOut, value: isShowingAddEventAlert)
                }
            }
        }
    }
}

struct BookFormView: View {
    @Binding var isShowingAddEventAlert: Bool
    @State private var eventName = ""
    @State private var eventLocation = ""
    @State private var eventDescription = ""
    @State private var eventImage = ""
    @State private var isOnlineSelected = true

    var body: some View {
        VStack {
            TextField("Event Name", text: $eventName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .padding(.horizontal, 16)
            
            TextField("Location", text: $eventLocation)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .padding(.horizontal, 16)
            
            HStack {
                Button(action: { isOnlineSelected = true }) {
                    Text("Online")
                        .padding()
                        .background(isOnlineSelected ? Color.purple : Color.gray)
                        .cornerRadius(30)
                }
                Button(action: { isOnlineSelected = false }) {
                    Text("Offline")
                        .padding()
                        .background(!isOnlineSelected ? Color.purple : Color.gray)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal)
            
            TextField("Description", text: $eventDescription)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    BookView()
}
