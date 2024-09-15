//
//  PhsychologyButtonView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct PhsychologyButtonView: View {
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hex: "E0DFDF")) // Use custom hex color
                    .frame(height: 100)
                
                Image("phsychologyIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
            }
            Text("psychology")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "873399"))
        }
    }
}

#Preview {
    PhsychologyButtonView()
}
