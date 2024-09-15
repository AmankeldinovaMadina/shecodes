//
//  EventButtonView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct EventButtonView: View {
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hex: "E0DFDF")) // Use custom hex color
                    .frame(height: 260)
                
                Image("eventIcon")
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 200, height: 200)
                
            }
            Text("event")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "873399"))
        }
    }
}

#Preview {
    EventButtonView()
}
