//
//  UIImageView+extension.swift
//  Hole
//
//  Created by Alexey Mikhailov on 08.06.2021.
//

import UIKit

extension UIImageView {
    
    func applyGradientPattern(_ pattern: UIImage) {
        let size = frame.size
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContext(size)
        self.image!.draw(in: rect)
        pattern.draw(in: rect, blendMode: .destinationOut, alpha: 1.0)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = newImage
    }

}


