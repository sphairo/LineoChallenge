import Foundation

struct Favorite: Swift.Decodable {
    let id: Int
    let owner: Owner
    let createdAt, visibility, name: String
    let products: [String: Product]
    let accessHash: String?
}

struct Owner: Swift.Decodable {
    let name, email, linioId: String
}

struct Product: Swift.Decodable {
    let id, linioPlusLevel: Int
    let wishListPrice: Float
    let slug, url, image, conditionType, name: String
    let freeShipping, imported, active: Bool
}

typealias Favorites = [Favorite]
