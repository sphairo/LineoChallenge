import UIKit

class CollectionCreatedByUserCell: UICollectionViewCell {

    private var products: [Product] = []
    
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var totalProductsLabel: UILabel!
    @IBOutlet weak var secondProductImageView: UIImageView!
    @IBOutlet weak var thirdProductImageView: UIImageView!
    @IBOutlet weak var firtsProductImageView: UIImageView!
    @IBOutlet weak var firtsContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var thirdContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    func setupCollection(products: [String: Product], collectionName: String) {
        self.products = []
        for (index, element) in products.enumerated() {
            self.products.append(element.value)
            if index < 3 {
                var imageView: UIImageView = UIImageView()
                if index == 0 {
                    imageView = firtsProductImageView
                }
                if index == 1 {
                    imageView = secondProductImageView
                }
                if index == 2 {
                    imageView = thirdProductImageView
                }
                setupProductImage(self.products[index].image, imageView: imageView)
            }
        }
        
        totalProductsLabel.text = "\(self.products.count)"
        collectionNameLabel.text = collectionName
    }
    
    func setupProductImage(_ pathImage: String, imageView: UIImageView) {
        if let image = getImageCacheBy(urlPath: pathImage) {
            imageView.image = image
        } else {
            downloadImage(from: pathImage) { (image, url) in
                if let image = image {
                    saveImageCache(image: image, forKey: url?.absoluteString)
                    imageView.image = image
                }
            }
        }
    }
    
    private func setupView() {
        firtsContainerView.cornerRadius()
        secondContainerView.cornerRadius()
        thirdContainerView.cornerRadius()
    }
}
