//
//  UITableView+extension.swift
//  Hole
//
//  Created by Alexey Mikhailov on 07.06.2021.
//

import UIKit

extension UITableView {
    
    func setBackgroundGradient(
        topColor    : UIColor = UIColor(red: 174/255, green: 139/255, blue: 240/255, alpha: 1.0),
        centerColor : UIColor = UIColor(red: 101/255, green: 178/255, blue: 226/255, alpha: 1.0),
        bottomColor : UIColor = UIColor(red: 42/255, green: 221/255, blue: 216/255, alpha: 1.0)
    ) {
        let gradientBackgroundColors = [topColor.cgColor,
                                        centerColor.cgColor,
                                        bottomColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0.0 , 0.5 , 1.0]
        gradientLayer.frame = bounds
        
        let backgroundView = UIView(frame: bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundView = backgroundView
    }
    
    
    func registerNib(with identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }
    
}
