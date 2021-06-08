//
//  HoleTableViewCell.swift
//  HoleTable
//
//  Created by Alexey Mikhailov on 07.06.2021.
//

import UIKit

class HoleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var holeView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    static let identifier = "HoleTableViewCell"
    
    func configureText(by row: Int) {
        titleLabel.text = "Дырка в ячейке №\(row)"
    }

    func makeHole() {
        // Берем путь у whiteView
        let path = UIBezierPath(rect: whiteView.bounds)
        // Создаем путь у holeView и скругляем его углы на 8
        let pathWithRadius = UIBezierPath(roundedRect: holeView.frame,
                                          byRoundingCorners: [.allCorners],
                                          cornerRadii: CGSize(width: 8, height: 8))
        // Создаем общую геометрию пути
        path.append(pathWithRadius)
        // Создаем маску по этой геометрии, и применяем правило заливки evenOdd, которое как раз и делает дырку
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        // Применяем полученную маску к whiteView
        whiteView.layer.mask = mask
    }
    
}
