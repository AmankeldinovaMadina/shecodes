import SwiftUI

struct MatchingView: View {
    @StateObject private var petViewModel = PetViewModel() // PetViewModel to fetch pets
    @StateObject private var authViewModel = AuthViewModel() // AuthViewModel to manage authentication
    @State private var showPetSearchView = false
    @State private var dragOffset: CGSize = .zero
    @State private var rotationAngle: Double = 0.0
    @State private var currentIndex = 0 // Index of the top card

    var body: some View {
        if showPetSearchView {
            PetSearchView(pets: petViewModel.pets)
        } else {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showPetSearchView.toggle()
                    }, label: {
                        Text("See all")
                            .font(.system(size: 28, weight: .bold))
                            .padding()
                            .foregroundColor(.purple)
                    })
                }
                
                // If accessToken is nil, show login prompt
                if petViewModel.pets.isEmpty {
                    ProgressView("")
                        .onAppear(){
                            petViewModel.fetchPets()
                        }
                }  else {
                    // Card stack for fetched pets
                    ZStack {
                        ForEach(petViewModel.pets.indices, id: \.self) { index in
                            if index >= currentIndex {
                                CardView(pet: petViewModel.pets[index])
                                    .zIndex(Double(petViewModel.pets.count - index))
                                    .offset(index == currentIndex ? dragOffset : .zero)
                                    .rotationEffect(index == currentIndex ? .degrees(rotationAngle) : .zero)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                dragOffset = gesture.translation
                                                rotationAngle = Double(gesture.translation.width / 20)
                                            }
                                            .onEnded { gesture in
                                                if gesture.translation.width > 150 {
                                                    // Swipe right - like
                                                    handleSwipeRight()
                                                } else if gesture.translation.width < -150 {
                                                    // Swipe left - dislike
                                                    handleSwipeLeft()
                                                } else {
                                                    // Reset position if not enough drag
                                                    withAnimation {
                                                        dragOffset = .zero
                                                        rotationAngle = .zero
                                                    }
                                                }
                                            }
                                    )
                                    .animation(.spring(), value: dragOffset)
                            }
                        }
                    }
                    .padding()
                    
                    // Like/Dislike buttons (optional)
                    HStack {
                        Button(action: handleSwipeLeft) {
                            Image("Dislike")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.pink)
                        }
                        Spacer()
                            .frame(width: 130)
                        Button(action: handleSwipeRight) {
                            Image("Like")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    // Swipe right to like
    private func handleSwipeRight() {
        withAnimation {
            dragOffset = CGSize(width: 500, height: 0)
            rotationAngle = 30
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            moveCardToBack()
        }
    }
    
    // Swipe left to dislike
    private func handleSwipeLeft() {
        withAnimation {
            dragOffset = CGSize(width: -500, height: 0)
            rotationAngle = -30
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            moveCardToBack()
        }
    }
    
    // Move the card to the back of the stack
    private func moveCardToBack() {
        currentIndex += 1
        dragOffset = .zero
        rotationAngle = .zero
    }
}


#Preview {
    MatchingView()
}
