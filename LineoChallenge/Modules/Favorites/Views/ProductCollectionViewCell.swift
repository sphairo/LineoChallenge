import UIKit

struct Conditiontype {
    static let refurbished = "refurbished"
    static let isNew = "new"
}

struct LinioPlusLevel {
    static let one = 1
    static let two = 2
}

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var internationalImageView: UIImageView!
    @IBOutlet weak var refusbishedImageView: UIImageView!
    @IBOutlet weak var freeShippingImageView: UIImageView!
    @IBOutlet weak var plus48ImageView: UIImageView!
    @IBOutlet weak var isNewImageView: UIImageView!
    
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

    func setupProduct(with product:Product) {
        freeShippingImageView.isHidden = !product.freeShipping
        internationalImageView.isHidden = !product.imported
        
        if product.linioPlusLevel == LinioPlusLevel.one {
            plus48ImageView.isHidden = true
            plusImageView.isHidden = false
        } else if product.linioPlusLevel == LinioPlusLevel.two {
            plus48ImageView.isHidden = false
            plusImageView.isHidden = true
        } else {
            plus48ImageView.isHidden = true
            plusImageView.isHidden = true
        }
        
        if product.conditionType == Conditiontype.refurbished {
            refusbishedImageView.isHidden = false
            isNewImageView.isHidden = true
        } else if product.conditionType == Conditiontype.isNew {
            isNewImageView.isHidden = false
            refusbishedImageView.isHidden = true
        }
        
        if let image = getImageCacheBy(urlPath: product.image) {
            productImageView.image = image
        } else {
            downloadImage(from: product.image) { [weak self] (image, url) in
                if let image = image {
                    saveImageCache(image: image, forKey: url?.absoluteString)
                    self?.productImageView.image = image
                }
            }
        }
    }
    
    private func setupView() {
        contentView.cornerRadius()
    }
}
