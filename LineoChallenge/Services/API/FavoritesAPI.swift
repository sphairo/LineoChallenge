import Foundation

private struct Endpoint {
    static let favoritesURLString = "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json"
}

class FavoritesAPI {
    private(set) var apiManager = RequestManager()
    
    func fetchFavorites(completion: @escaping (_ success: Bool, _ object: Favorites?, _ error: Error?) -> ()) {
        apiManager.request(with: Endpoint.favoritesURLString, body: nil, method: HttpMethod.GET) { (success, jsonData, error, statusCode) in
            if let jsonData = jsonData {
                do {
                    let favorites = try JSONDecoder().decode(Favorites.self, from: jsonData)
                    completion(true, favorites, error)
                } catch let jsonError {
                    completion(false, nil, jsonError)
                }
            } else {
                completion(false, nil, error)
            }
        }
    }
}
