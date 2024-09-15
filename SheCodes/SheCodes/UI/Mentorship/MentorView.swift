//
//  MentorView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct MentorView: View {
    var mentors: [Mentor] = [
        Mentor(
            name: "Nazerke Murat",
            location: "Astana, Kazakhstan",  // You can update this as needed
            email: "madon@gmail.com",
            image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/c1fdbd50-0eee-4606-99fa-74b3b63eb719-Nazerke%20Murat",
            experience: "As a mentor, my goal is to guide you through personal and professional growth by offering insight, support, and practical strategies tailored to your journey. Whether you're navigating career challenges, personal development, or looking to gain clarity in your goals, I’m here to provide guidance based on experience and understanding.",
            score: 4
        ),
        Mentor(
            name: "Arman Bolatove",
            location: "Astana, Kazakhstan",  // You can update this as needed
            email: "madon@gmail.com",
            image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/46b1a5b8-0b12-4f10-b10a-6896f7f576b4-Arman%20Bolatove",
            experience: "As a mentor, my goal is to guide you through personal and professional growth by offering insight, support, and practical strategies tailored to your journey. Whether you're navigating career challenges, personal development, or looking to gain clarity in your goals, I’m here to provide guidance based on experience and understanding.",
            score: 5
        ),
        Mentor(
            name: "Leonardo DiCaprio",
            location: "Astana, Kazakhstan",  // You can update this as needed
            email: "madon@gmail.com",
            image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/a429edbd-d93b-4b9e-9932-c5c15929b72b-Leonardo%20DiCaprio",
            experience: "As a mentor, my goal is to guide you through personal and professional growth by offering insight, support, and practical strategies tailored to your journey. Whether you're navigating career challenges, personal development, or looking to gain clarity in your goals, I’m here to provide guidance based on experience and understanding.",
            score: 5
        ),
        Mentor(
            name: "Madina Nurlyman",
            location: "Astana, Kazakhstan",  // You can update this as needed
            email: "madon@gmail.com",
            image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/cb10c2f2-d8f2-4226-9af9-7144da99de6c-Madina%20Nurlyman",
            experience: "As a mentor, my goal is to guide you through personal and professional growth by offering insight, support, and practical strategies tailored to your journey. Whether you're navigating career challenges, personal development, or looking to gain clarity in your goals, I’m here to provide guidance based on experience and understanding.",
            score: 5
        ),
        Mentor(
            name: "Naziken Bitabarova",
            location: "Astana, Kazakhstan",  // You can update this as needed
            email: "madon@gmail.com",
            image_location: "https://mybucketkam.s3.eu-north-1.amazonaws.com/bf37bc33-c4ef-4d8c-8f98-05d07b4c2018-Naziken%20Bitabarova",
            experience: "As a mentor, my goal is to guide you through personal and professional growth by offering insight, support, and practical strategies tailored to your journey. Whether you're navigating career challenges, personal development, or looking to gain clarity in your goals, I’m here to provide guidance based on experience and understanding.",
            score: 5
        )
    ]


    @State private var isShowForm = false
    @State private var isShowingHome = false
    @State private var showMentorProfile = false
    @State private var example = Mentor(name: "Daulet Issatayev", location: "Astana, Kazakhstan", email: "daulet.issatayev@gmail.com", image_location: "Daulet", experience: "One of the largest annual university hackathons in Central Asia. Hosted at Nazarbayev University by the NU Student Chapter of the Association for Computing Machinery", score: 5)
    var body: some View {
        if isShowingHome {
            HomeView()
        }else if showMentorProfile {
            MentorProfileView(mentor: example)
        }else {
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
                            Text("Mentorship")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(hex: "873399"))
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
                            ForEach(mentors, id: \.id) { mentor in
                                Button(action: {
                                    example = mentor
                                    showMentorProfile = true
                                }, label: {
                                    MentorCardView(mentor: mentor)
                                })
                                
                            }
                            .padding()
                        }
                        
                        // Floating Add Button
                        Button(action: {
                            isShowForm = true
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
                if isShowForm {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack {
                        VStack(alignment: .center, spacing: 20) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    isShowForm = false // Dismiss the alert
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
                                isShowForm = false // Dismiss the alert after submission
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
                    .animation(.easeInOut, value: isShowForm)
                }
            }
        }
    }
}

#Preview {
    MentorView()
}
