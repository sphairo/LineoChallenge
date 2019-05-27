import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBarTitle()
        selectedIndex = 2//Default index selected for this challenge
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
