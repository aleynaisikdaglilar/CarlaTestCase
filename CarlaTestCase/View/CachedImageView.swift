//
//  CachedImageView.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 27.06.2024.
//

import UIKit

class CachedImageView: UIImageView {
    
    private static let imageCache = NSCache<NSString, UIImage>()
    
    private var imageUrlString: String?
    
    func loadImage(from urlString: String, placeholder: UIImage? = nil) {
        self.imageUrlString = urlString
        self.image = placeholder
        
        if let cachedImage = CachedImageView.imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load image:", error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data) {
                    if self.imageUrlString == urlString {
                        self.image = downloadedImage
                    }
                    CachedImageView.imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                }
            }
        }.resume()
    }
}

