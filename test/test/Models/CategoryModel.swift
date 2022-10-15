//
//  CategoryModel.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import Foundation
import UIKit

struct Category {
    var name: String
    var image: UIImage?
}

struct CategoryManager {
    var name: String
    var image: UIImage?
    var category: [Category]
    
    static var allCategory: [Self] = [
        .init(name: "Светлое", image: UIImage(named: "bannerOne"), category: []),
        .init(name: "Тёмное", image: UIImage(named: "bannerTwo"), category: []),
        .init(name: "Нефильт.", image: UIImage(named: "bannerThree"), category: []),
        .init(name: "Пшенич.", image: UIImage(named: "bannerFour"), category: [])
    ]
}
