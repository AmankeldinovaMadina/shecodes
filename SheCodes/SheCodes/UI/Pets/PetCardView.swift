import SwiftUI


struct PetCardView: View {
    var pet: Pet

    var body: some View {
        ZStack(alignment: .bottom) {
            // Pet Image using the `image_location` field
            AsyncImage(url: URL(string: pet.image_location)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 270)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }

            ZStack(alignment: .bottom){
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 86) // Set gradient height
                .cornerRadius(10)

                // Text Details
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text(pet.name)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        Spacer()
                    }
                    Text("Lives in \(pet.location)")
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                    Text("Lives in 15 miles away")
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                }
                .padding(.bottom)
            }

            // Circular Button
            Button(action: {
                // Action for the button
                print("Phone button tapped")
            }) {
                Image(systemName: "phone.fill")
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
}
