//
//  BookClubs.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import Foundation


struct BookClub: Identifiable {
    var id: String
    var name: String
    var description: String
    var location: String
    var memberCount: Int
    var imageLocation: String
    var currentBook: String
    var currentBookImage: String
}
