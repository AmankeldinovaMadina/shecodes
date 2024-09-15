//
//  Mentor.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import Foundation


struct Mentor: Decodable, Identifiable {
 
    var id = UUID()
    let name: String
    let location: String
    let email: String
    let image_location: String
    let experience: String
    let score: Int
}
