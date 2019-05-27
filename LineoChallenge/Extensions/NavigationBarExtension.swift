import UIKit

extension UINavigationBar {
    func setupNavigationBarTitle(className: String) {
        switch className {
        case ControllerName.Start.rawValue :
            setupTopItemTitle(title: Constant.StartScreenName)
            break
        case ControllerName.Search.rawValue :
            setupTopItemTitle(title: Constant.SearchScreenName)
            break
        case ControllerName.Favorites.rawValue :
            setupTopItemTitle(title: Constant.FavoritesScreenName)
            break
        case ControllerName.MyAccount.rawValue :
            setupTopItemTitle(title: Constant.MyAccountScreenName)
            break
        case ControllerName.Cart.rawValue :
            setupTopItemTitle(title: Constant.CartScreenName)
            break
        default:
            setupTopItemTitle(title: "")
        }
    }
    
    private func setupTopItemTitle(title: String) {
        topItem?.title = title
    }
    
}
