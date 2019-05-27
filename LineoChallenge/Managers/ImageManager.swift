import Foundation
import UIKit

func getImageCacheBy(urlPath: String?) -> UIImage? {
    if urlPath != nil {
        return NSCache<AnyObject, AnyObject>().object(forKey: urlPath as AnyObject) as? UIImage
    }
    return nil
}

func saveImageCache(image: UIImage, forKey urlPath: String?) {
    if urlPath != nil {
        NSCache<AnyObject, AnyObject>().setObject(image, forKey: urlPath as AnyObject)
    }
}

func downloadImage(from urlPath: String, completionHandler: @escaping (_ image: UIImage?, _ urlPath: URL?) -> Void ) {
    if let url = URL(string: urlPath) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        completionHandler(image, url)
                    }
                    completionHandler(nil, nil)
                }
            }
            completionHandler(nil, nil)
        }
    } else {
        completionHandler(nil, nil)
    }
}
