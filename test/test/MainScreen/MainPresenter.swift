//
//  MainPresenter.swift
//  test
//
//  Created by sem1 on 14.10.22.
//

import Foundation

protocol MainViewDelegate: AnyObject {
    func updateTableView()
}

class MainPresenter {
    
    private let networkingManager = NetworkingManager()
    weak var viewDelegate: MainViewDelegate?
    var beerModel: [BeerModel]?
    var categoryModel = CategoryManager.allCategory
    
    func setupNetworking() {
        networkingManager.request(endpoint: BeerAPI.link) { [weak self] (result: Result<[BeerModel], NetworkingError>) in
            switch result {
            case .success(let result):
                self?.beerModel = result
                self?.viewDelegate?.updateTableView()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
