import SwiftUI

 

struct EventCardView: View {
    let event: Event
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(event.image_location)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(Color.black.opacity(0.2)) // Dark overlay
                .frame(width: 330, height: 250)
                .cornerRadius(20)
                .clipped()

            // This VStack is properly constrained inside the ZStack
            VStack(alignment: .leading) {
                Spacer() // Pushes the text to the bottom of the VStack
                Text(event.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 2) // Adds padding between title and description

                Text(event.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
            .padding() // Padding for the content inside the VStack
        }
        .frame(width: 330, height: 250) // Make sure the ZStack and content have the same size
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding() // Optional padding around the card
    }
}

 
 
