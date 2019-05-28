import UIKit

struct Section {
    static let userCollections = 0
    static let allFavorites = 1
}

class FavoritesViewController: UIViewController {
    
    var favoritesViewModel = FavoritesViewModel()
    static var numberOfSections: Int = 2
    lazy var screenWidth: CGFloat = {
        return UIScreen.main.bounds.size.width
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        favoritesViewModel.attachView(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarTitle()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FavoritesViewController.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == Section.userCollections && favoritesViewModel.numberOfItems() > 0 {
            return 1
        }
        return favoritesViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == Section.userCollections {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuseIdentifier, for: indexPath) as! UserCollectionViewCell
            cell.setupViewCell(with: favoritesViewModel.getFavorites() ?? [])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.setupProduct(with: favoritesViewModel.objectAt(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSectionReusableView.reuseIdentifier, for: indexPath) as! HeaderSectionReusableView
        reusableView.setupTitleSection(numberItems: favoritesViewModel.numberOfItemsToString())
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == Section.userCollections {
            return CGSize.zero
        }
        return CGSize(width: screenWidth, height: 45)
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == Section.userCollections {
            return CGSize(width: screenWidth - 20  , height: 178)
        }
        return CGSize(width: ((screenWidth - 40) / 2)   , height: 174)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

fileprivate extension FavoritesViewController {
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.setupNavigationBarTitle(className: self.className)
    }
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        collectionView.register(UserCollectionViewCell.nib, forCellWithReuseIdentifier: UserCollectionViewCell.reuseIdentifier)
        collectionView.register(HeaderSectionReusableView.nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderSectionReusableView.reuseIdentifier)
        collectionView.alwaysBounceVertical = true
    }
}

