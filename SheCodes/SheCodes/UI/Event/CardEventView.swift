import SwiftUI

struct CardEventView: View {
    var event: Event
    
    
    var body: some View {
 
            ZStack(alignment: .bottom) {
                Image(event.image_location) // Removed extra parenthesis
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 270)
                    .cornerRadius(10)
                    .clipped() // This ensures the image respects the frame and corner radius
                
                // Gradient overlay and Event details
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 86)
                .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(event.title)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        Spacer()
                    }
                    
                    Text(event.location)
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                    
                    Text(formattedDate(from: event.date))
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                }
                .padding(.bottom)

                // Circular button to show event details
                Button(action: {
//                    showDetail = true
                }) {
                    Image(systemName: "arrowshape.turn.up.forward.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .padding(16)
                        .background(Color.purple)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .shadow(radius: 10)
                }
                .offset(x: 70, y: 20)
            }
            .frame(width: 175, height: 270)
        
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
    CardEventView(event: Event(id: "66e5d82ea4b3940950844604",
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
