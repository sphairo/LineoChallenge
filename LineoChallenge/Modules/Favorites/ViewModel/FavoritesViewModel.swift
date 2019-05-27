import UIKit

protocol FavoritesProtocol {
    func getFavorites() -> [Favorites]
}

class FavoritesViewModel {
    
    var favoritesAPI = FavoritesAPI()
    weak var favoritesViewController: FavoritesViewController?
    
    private var favoritesModel:Favorites? {
        didSet {
            if let favoritesModel = favoritesModel {
                for favorite in favoritesModel {
                    for product in favorite.products {
                        self.products.append(product.value)
                    }
                }
            }
        }
    }
    
    private var products: [Product] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.favoritesViewController?.collectionView.reloadData()
            }
        }
    }
    
    func attachView(_ view:FavoritesViewController) {
        self.favoritesViewController = view
        favoritesAPI.fetchFavorites { [weak self] (success, favorites, error) in
            self?.favoritesModel = favorites
        }
    }
    
    func numberOfItems() -> Int {
        return products.count
    }
    
    func numberOfItemsToString() -> String {
        let numberOfItems = self.numberOfItems()
        return numberOfItems == 0 ? "" : "(\(numberOfItems))"
    }
    
    func objectAt(index: Int) -> Product {
        return products[index]
    }
    
    func getFavorites() -> Favorites? {
        return favoritesModel
    }
    
}
