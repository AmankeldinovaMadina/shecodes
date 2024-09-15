//
//  PsychologistCardVIew.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct PsychologistCardVIew: View {
    
    var psychologist: Psychologist
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading){
                    
                    Text(psychologist.name)
                        .font(.system(size: 18, weight: .medium))
                    Text(psychologist.location)
                        .font(.system(size: 18, weight: .light))
                    Text(psychologist.experience)
                        .font(.system(size: 18, weight: .thin))
                    StarRatingView(rating: psychologist.score)
                    
                }
                .foregroundColor(Color(hex: "873399"))
                Spacer()
                VStack{
                    Image(psychologist.image_location)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    PsychologistCardVIew(psychologist: Psychologist( id: UUID(), name: "Madina Amankeldinova", location: "Astana,Kazakhstan", phoneNumber: "87780564763", image_location: "Madina", experience: "5+ years of experience", score: 5))
}
