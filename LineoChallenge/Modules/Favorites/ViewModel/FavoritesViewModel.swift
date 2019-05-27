import UIKit

protocol FavoritesProtocol {
    func getFavorites() -> [Favorites]
}

class FavoritesViewModel {
    
    weak var favoritesViewController: FavoritesViewController?
    var favoritesAPI = FavoritesAPI()
    
    private var favoritesModel:Favorites? {
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
        return favoritesModel?.count ?? 0
    }
    
    func numberOfItemsToString() -> String {
        let numberOfItems = self.numberOfItems()
        return numberOfItems == 0 ? "" : "(\(numberOfItems))"
    }
    
    func objectAt(index: Int) -> Favorite? {
        return favoritesModel?[index]
    }
    
}
