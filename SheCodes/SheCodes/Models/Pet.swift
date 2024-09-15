import Foundation

struct Owner: Decodable, Identifiable {
    let _id: String
    let email: String
    let username: String
    let phoneNumber: String

    var id: String {
        return _id
    }
}

struct Pet: Decodable, Identifiable {
    let _id: String
    let name: String
    let type: String
    let owner: Owner
    let location: String
    let image_location: String

    var id: String {
        return _id
    }
}
