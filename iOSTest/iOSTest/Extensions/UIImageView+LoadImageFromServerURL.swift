import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?, userImageLoadingActivityView: UIActivityIndicatorView) {
        
        userImageLoadingActivityView.isHidden = false
        userImageLoadingActivityView.startAnimating()
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            
            userImageLoadingActivityView.stopAnimating()
            userImageLoadingActivityView.isHidden = true
            
            return
        }
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error?.localizedDescription ?? "") ")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                        
                        userImageLoadingActivityView.stopAnimating()
                        userImageLoadingActivityView.isHidden = true
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                            
                            userImageLoadingActivityView.stopAnimating()
                            userImageLoadingActivityView.isHidden = true
                        }
                    }
                }
            }).resume()
        }
    }
}
