//
//  PetButtonView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct PetButtonView: View {
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hex: "E0DFDF")) // Use custom hex color
                    .frame(height: 87)
                
                Image("petIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 124, height: 73)
                
            }
            Text("pet")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "873399"))
        }
    }
}

#Preview {
    PetButtonView()
}
