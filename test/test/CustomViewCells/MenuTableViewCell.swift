//
//  MenuTableViewCell.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static var reuseID: String {
        String(describing: self)
    }
    
    private lazy var beerImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 17)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 13)
        label.numberOfLines = 10
        label.textAlignment = .center
        return label
    }()
    
    private lazy var percentOfAlcoholLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 13)
        label.textColor = .systemPink
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemPink.cgColor
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        setupLayouts()
        setupLayoutConstraints()
    }
    
    private func setupLayouts() {
        [beerImageView, nameLabel,descriptionLabel,percentOfAlcoholLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            beerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            beerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            beerImageView.widthAnchor.constraint(equalToConstant: 132),
            beerImageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 32),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            nameLabel.widthAnchor.constraint(equalToConstant: 180),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 32),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 180),
            
            percentOfAlcoholLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 116),
            percentOfAlcoholLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            percentOfAlcoholLabel.heightAnchor.constraint(equalToConstant: 35),
            percentOfAlcoholLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configure(with model: BeerModel) {
        beerImageView.loadImageFromUrl(urlString: model.imageUrl)
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        percentOfAlcoholLabel.text = "\(model.abv) %"
    }
    
    override func prepareForReuse() {
        beerImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        percentOfAlcoholLabel.text = nil
    }
}
