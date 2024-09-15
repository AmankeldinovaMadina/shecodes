import SwiftUI


struct CardView: View {
    var pet: Pet

    var body: some View {
        ZStack(alignment: .bottom) {
            // Pet Image using the `image_location` field
            AsyncImage(url: URL(string: pet.image_location)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(24)
            } placeholder: {
                ProgressView()
            }

            ZStack(alignment: .bottom){
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 362) // Set gradient height
                .cornerRadius(24)
                
                // Text Details
                VStack(alignment: .leading, spacing: 4) {
                    Text(pet.name)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text("Lives in \(pet.location)")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    Text("Lives in 15 miles away")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                .padding(.bottom)
            }
        }
    }
}
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(pet: Pet(name: "Margaw Mysyqqyzy", location: "Kazakhstan, Semey", distance: "20 km away", image: "cat"))
//            .padding()
//    }
//}
