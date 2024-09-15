//
//  BookCardView.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import SwiftUI

struct BookCardView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Club Image
            Image("club-logo") // Placeholder for the logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding(.top, 20)
            
            // Title
            Text("Great Indie Reads")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            // Description
            Text("This club is managed by indie publisher DartFrog Books. Some books featured in this club will have been published by DartFrog....")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Location
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.black)
                Text("Astana, Kabanbai Batyr 53")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            
            // Members Count
            Text("83 members")
                .font(.subheadline)
                .foregroundColor(.black)
            
            // Section Divider
            Text("CURRENTLY READING")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // Book Image
            Image("currently-reading-book") // Placeholder for the book image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 250, height: 280) 
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView()
    }
}
