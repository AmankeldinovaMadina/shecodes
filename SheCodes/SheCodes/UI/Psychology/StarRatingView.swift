//
//  File.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import Foundation
import SwiftUI

struct StarRatingView: View {
    let rating: Int  // Rating is the score between 0-5
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(index <= rating ? .yellow : .gray)  // Fill stars up to the rating
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 4)
}



