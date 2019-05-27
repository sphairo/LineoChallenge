import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBarTitle()
    }
}

fileprivate extension TabBarController {
    func setupNavigationBarTitle() {
        navigationItem.title = Constant.StartScreenName
    }
    
    func setupTabBar() {
        UITabBar.appearance().barTintColor = UIColor.orange
        UITabBar.appearance().tintColor = .white
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = .white
        }
    }
}
