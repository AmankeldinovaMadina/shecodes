//
//  Event.swift
//  SheCodes
//
//  Created by Madina Amankeldinova on 15.09.2024.
//

import Foundation


struct Event: Decodable, Identifiable {
    let id: String
    let title: String
    let description: String
    let date: String
    let location: String
    let image_location: String
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, date, location, image_location, owner
    }
}


