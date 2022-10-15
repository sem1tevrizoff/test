//
//  BannerCollectionViewCell.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static var reuseID: String {
        String(describing: self)
    }
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        configureLayouts()
        setupLayoutConstraints()
    }
    
    private func configureLayouts() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with model: CategoryManager) {
        imageView.image = model.image
    }
}
