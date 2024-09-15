import SwiftUI

struct HomeView: View {
    @State private var showProfileView = false
    @State private var showPetView = false
    @State private var showPsyView = false
    @State private var showMentorView = false
    @State private var showEventView = false
    var body: some View {
        if(showPetView){
            MatchingView()
        } else  if showPsyView{
            PhsychologyView()
        } else if showMentorView {
            MentorView()
        } else if showEventView {
            EventView()
        } else {
            ScrollView { // Wrap the content in a ScrollView to make it scrollable
                VStack {
                    HStack {
                        Button(action: {
                            // Add button action here
                        }, label: {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.purple)
                        })
                        Spacer()
                    }
                    
                    // Category buttons layout
                    HStack(spacing: 16) {
                        Button(action: {
                            showPetView.toggle()
                        }, label: {
                            PetButtonView()
                        })
                        Button {
                            showMentorView = true
                        } label: {
                            MentorButtonView()
                        }

                    }
                    
                    HStack(spacing: 16) {
                        VStack {
                            Button(action: {
                                showPsyView = true
                            }, label: {
                                PhsychologyButtonView()
                            })
                            BookButtonView()
                        }
                        Button(action: {
                            showEventView = true
                        }, label: {
                            EventButtonView()
                        })
                        
                    }
                    
                    HStack {
                        OportunityButtonView()
                    }
                    
                    Divider()
                    
                    // Event recommendation view
                    EventRecView()
                        .padding(.top)
                }
                .padding(.horizontal) // Keep the horizontal padding
            }
        }
    }
}

#Preview {
    HomeView()
}
