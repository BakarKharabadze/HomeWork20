//
//  Image+Extension.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/11/24.
//

import UIKit

extension UIImage {
    func scaledToSize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
}
