//
//  Image+Enum.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import Foundation
import UIKit

enum AssetsCatalog {
    case menu
    case contacts
    case profile
    case stash
    case bannerOne
    
    var image: UIImage? {
        switch self {
        case .menu:
            return UIImage(named: "menu")
        case .contacts:
            return UIImage(named: "contacts")
        case .profile:
            return UIImage(named: "profile")
        case .stash:
            return UIImage(named: "stash")
        case .bannerOne:
            return UIImage(named: "bannerOne")
        }
    }
}
