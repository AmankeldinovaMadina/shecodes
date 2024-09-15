//
//  PhsychologyView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct PhsychologyView: View {
    var psychologists: [Psychologist] = [
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5),
    Psychologist(name: "Madina", location: "Astana, Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience:"5+ years of experience", score: 5)
    
    ]
    @State private var showForm = false
    @State private var isShowingHome = false
    @State private var isAIChat = false
    
    var body: some View {
        if isShowingHome {
            HomeView()
        } else if isAIChat {
            ChatView()
        }
        else {
            ZStack {
                NavigationView {
                    VStack {
                        //  Bar
                        HStack {
                            Button {
                                isShowingHome = true
                            } label: {
                                Image("back")
                            }
                            Spacer()
                            Text("Psycology")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(red: 135, green: 51, blue: 153))
                            Spacer()
                        }
                        .padding(.horizontal)
                        ScrollView {
                            VStack {
                                TalkView()
                                    .padding(.bottom)
                                Divider()
                                
                                Button(action: {
                                    isAIChat = true
                                }, label: {
                                    HStack{
                                        VStack{
                                            Text(" Find your best match")
                                                .font(.system(size: 20, weight: .semibold))
                                                .foregroundColor(.purple)
                                            Text("psycologist with AI")
                                                .font(.system(size: 20, weight: .semibold))
                                                .foregroundColor(.purple)
                                        } .padding(.leading)
                                        Spacer()
                                        Image("phsychologyIcon")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 79, height: 48)
                                    } .padding()
                                })
                                Divider()
                                ForEach(psychologists, id: \.id) { psychologist in
                                    PsychologistCardVIew(psychologist: psychologist)
                                }
                                
                            }
                        }
                        // Floating Add Button
                        Button(action: {
                            showForm = true
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
                if showForm {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack {
                        VStack(alignment: .center, spacing: 20) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    showForm = false // Dismiss the alert
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.purple)
                                        .padding()
                                        .fontWeight(.bold)
                                }
                            }
                            
                            HStack {
                                Text("Otinish beru")
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
                                    Text("Email")
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
                            
                            VStack {
                                HStack {
                                    Text("Daleldeitin quzhaty")
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
                                showForm = false // Dismiss the alert after submission
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
                    .animation(.easeInOut, value: showForm)
                }
            }
        }
    }
}
