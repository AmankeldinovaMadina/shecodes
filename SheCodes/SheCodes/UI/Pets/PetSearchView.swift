import SwiftUI

struct PetSearchView: View {
    var pets: [Pet]

    @State private var isShowingAddPetAlert = false
    @State private var isShowingHome = false
    var body: some View {
        if isShowingHome {
            HomeView()
        } else {
            ZStack {
                NavigationView {
                    VStack {
                        // Search Bar
                        HStack {
                            Button {
                                isShowingHome = true
                            } label: {
                                Image("back")
                            }
                            Spacer()
                            Text("Pets")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(red: 135, green: 51, blue: 153))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.purple)
                                .padding(.leading, 10)
                            
                            TextField("Search for a pet", text: .constant(""))
                                .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                .padding(10)
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(25)
                        .padding()
                        .padding(.top, 8)
                        
                        // Grid of Pet Cards
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(pets) { pet in
                                    PetCardView(pet: pet)
                                }
                            }
                            .padding()
                        }
                        
                        // Floating Add Button
                        Button(action: {
                            isShowingAddPetAlert = true
                        }) {
                            Image("Add")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 68, height: 68)
                                .padding(30)
                        }
                        .frame(width: 80, height: 80)
                    }
                }
                
                // Custom Alert Modal...
                if isShowingAddPetAlert {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack {
                        VStack(alignment: .center, spacing: 20) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    isShowingAddPetAlert = false // Dismiss the alert
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.purple)
                                        .padding()
                                        .fontWeight(.bold)
                                }
                            }
                            
                            HStack {
                                Text("Zhanuardy qosy")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                            }
                            .padding(.horizontal)
                            
                            // Form Fields
                            VStack {
                                HStack {
                                    Text("Esimi")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                    Spacer()
                                }
                                TextField("", text: .constant(""))
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(30)
                                    .foregroundColor(Color.purple)
                            }
                            .padding(.horizontal, 16)
                            
                            VStack {
                                HStack {
                                    Text("Meken zhaiy")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                    Spacer()
                                }
                                TextField("", text: .constant(""))
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(30)
                                    .foregroundColor(Color.purple)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 16)
                            
                            VStack {
                                HStack {
                                    Text("Sipattamasy")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                    Spacer()
                                }
                                TextField("", text: .constant(""))
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(30)
                                    .foregroundColor(Color.purple)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 16)
                            
                            VStack {
                                HStack {
                                    Text("Sureti")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color(red: 135 / 255, green: 51 / 255, blue: 153 / 255))
                                    Spacer()
                                }
                                TextField("", text: .constant(""))
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(30)
                                    .foregroundColor(Color.purple)
                                    .padding(.bottom, 20)
                            }
                            .padding(.horizontal)
                            
                            // Submit Button
                            Button(action: {
                                // Submit the form action
                                isShowingAddPetAlert = false // Dismiss the alert after submission
                            }) {
                                Text("Jiberu")
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
                    .animation(.easeInOut, value: isShowingAddPetAlert)
                }
            }
        }
    }
}

#Preview {
    PetSearchView(pets: [])
}
