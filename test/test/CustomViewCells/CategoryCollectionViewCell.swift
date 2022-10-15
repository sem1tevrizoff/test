//
//  CategoryCollectionViewCell.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var reuseID: String {
        String(describing: self)
    }
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemPink
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        setupLayouts()
        setupLayoutConstraints()
        setupLayers()
    }
    
    private func setupLayouts() {
        [categoryLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            categoryLabel.widthAnchor.constraint(equalToConstant: 80),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    private func setupLayers() {
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemPink.cgColor
    }
    
    func configure(with model: CategoryManager) {
        categoryLabel.text = model.name
    }
}
