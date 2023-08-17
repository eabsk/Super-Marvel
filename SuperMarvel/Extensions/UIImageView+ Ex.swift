//
//  UIImageView+ Ex.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 17/08/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
   public func getImage(imagePath: String) {
        if let url = URL(string: imagePath) {
            self.kf.setImage(with: url,
                             placeholder: Asset.Assets.marvelLogo.image)
        }
    }
}
