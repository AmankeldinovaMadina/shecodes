//
//  MentorCardView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct MentorCardView: View {
    
    var mentor: Mentor
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading){
                    
                    Text(mentor.name)
                        .font(.system(size: 18, weight: .medium))
                    Text(mentor.location)
                        .font(.system(size: 18, weight: .light))

                    StarRatingView(rating: mentor.score)
                    
                }
                .foregroundColor(Color(hex: "873399"))
                Spacer()
                VStack{
                    Image(mentor.image_location)
                }
            }
            Divider()
        }
        .padding()
    }
}


#Preview {
    MentorCardView(mentor: Mentor(name: "Daulet Issatayev", location: "Astana, Kazakhstan", email: "daulet.issatayev@gmail.com", image_location: "Daulet", experience: "One of the largest annual university hackathons in Central Asia. Hosted at Nazarbayev University by the NU Student Chapter of the Association for Computing Machinery", score: 5))
}
