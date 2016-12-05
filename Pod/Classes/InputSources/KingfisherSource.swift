//
//  KingfisherSource.swift
//  ImageSlideshow
//
//  Created by feiin
//
//

import Kingfisher

public class KingfisherSource: NSObject, InputSource {
    var url: URL
    var placeholder: UIImage?
    var name : String!
    
    public init(url: URL, name : String) {
        self.url = url
        self.name = name
        super.init()
    }
    
    public init(url: URL, placeholder: UIImage, name : String) {
        self.url = url
        self.placeholder = placeholder
        self.name = name
        super.init()
    }
    
    public init?(urlString: String, name : String) {
        if let validUrl = URL(string: urlString) {
            self.url = validUrl
            self.name = name
            super.init()
        } else {
            return nil
        }
    }

    @objc public func load(to imageView: UIImageView, with callback: @escaping (UIImage) -> ()) {
        imageView.kf.setImage(with: self.url, placeholder: self.placeholder, options: nil, progressBlock: nil) { (image, _, _, _) in
            if let image = image {
                callback(image)
            }
        }
    }
}
