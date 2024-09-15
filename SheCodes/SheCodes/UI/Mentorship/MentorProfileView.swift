//
//  MentorProfileView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct MentorProfileView: View {
    @State private var isShowingHome = false
    var mentor: Mentor
    
    var body: some View {
        if isShowingHome {
            MentorView()
        } else {
            VStack{
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
                
                Image(mentor.image_location)
                    .padding()
                Text(mentor.name)
                    .font(.system(size: 20, weight: .semibold))
                StarRatingView(rating: mentor.score)
                    .padding()
                
                Group{
                    HStack{
                        Image("star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                        Text(mentor.experience)
                        Spacer()
                    }
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                        Text(mentor.location)
                        Spacer()
                    }
                    HStack{
                        Image("emailIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                        Text(mentor.email)
                        Spacer()
                    }
                } .padding(.horizontal)
                    .padding(.top)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: "873399"))
                Spacer()
                Text("Menti atanu")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.green]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .padding(.horizontal, 45)
                
            }
        }
    }
}

#Preview {
    MentorProfileView(mentor: Mentor(name: "Daulet Issatayev", location: "Astana, Kazakhstan", email: "daulet.issatayev@gmail.com", image_location: "Daulet", experience: "One of the largest annual university hackathons in Central Asia. Hosted at Nazarbayev University by the NU Student Chapter of the Association for Computing Machinery", score: 5))
}
