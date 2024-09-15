//
//  MentorButtonView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct MentorButtonView: View {
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hex: "E0DFDF")) // Use custom hex color
                    .frame(height: 87)
                
                Image("mentorButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
            }
            Text("Mentor")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "873399"))
                .padding(.top, -4)
        }
    }
}

#Preview {
    MentorButtonView()
}
