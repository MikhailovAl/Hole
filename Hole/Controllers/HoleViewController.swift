//
//  HoleViewController.swift
//  HoleTable
//
//  Created by Alexey Mikhailov on 07.06.2021.
//

import UIKit

class HoleViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var holeView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        setBackgroundGradient()
        makeHole()
    }
    
    func makeHole() {
        // Берем путь у whiteView
        let path = UIBezierPath(rect: whiteView.bounds)
        // Создаем путь у holeView и скругляем его
        let pathWithRadius = UIBezierPath(roundedRect: holeView.frame,
                                          byRoundingCorners: [.allCorners],
                                          cornerRadii: holeView.frame.size)
        // Создаем общую геометрию пути
        path.append(pathWithRadius)
        // Создаем маску по этой геометрии, и применяем правило заливки evenOdd, которое как раз и делает дырку
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        // Применяем полученную маску к whiteView
        whiteView.layer.mask = mask
    }
    
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
        gradientLayer.frame = view.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}




