//
//  BeerModel.swift
//  test
//
//  Created by sem1 on 14.10.22.
//

import Foundation


struct BeerModel: Codable {
    let name: String
    let description: String
    let imageUrl: String
    let abv: Double
    
    enum CodingKeys: String, CodingKey {
        case name, description, abv
        case imageUrl = "image_url"
    }
}
