//
//  MainViewController+Extension.swift
//  test
//
//  Created by sem1 on 15.10.22.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseID, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        
        let model = presenter.categoryModel[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.beerModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseID, for: indexPath) as? MenuTableViewCell,
             let cellModel = presenter.beerModel?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        
        if contentOffset > 100 {
            self.heightBannerCollectionViewConstraint?.constant = 0
            self.menuListTableView.layer.cornerRadius = 0
        } else {
            self.heightBannerCollectionViewConstraint?.constant = 115
            self.menuListTableView.layer.cornerRadius = 30
        }
    }
}
