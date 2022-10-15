//
//  ViewController.swift
//  test
//
//  Created by sem1 on 13.10.22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let categoryView = CategoryView()
    let presenter: MainPresenter
    var heightBannerCollectionViewConstraint: NSLayoutConstraint?
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва ⌄"
        return label
    }()
    
    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 112)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseID)
        return collectionView
    }()
    
    lazy var menuListTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        tableView.layer.cornerRadius = 30
        tableView.separatorInset.left = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainSetup()
        view.backgroundColor = .systemGray
    }
    
    init(presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        setupLayouts()
        setupLayoutConstraints()
        presenter.viewDelegate = self
        presenter.setupNetworking()
    }
    
    private func setupLayouts() {
        [cityLabel, bannerCollectionView, menuListTableView, categoryView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityLabel.widthAnchor.constraint(equalToConstant: 100),
            cityLabel.heightAnchor.constraint(equalToConstant: 21),
            
            bannerCollectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            bannerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            categoryView.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryView.heightAnchor.constraint(equalToConstant: 60),
            
            menuListTableView.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 10),
            menuListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        heightBannerCollectionViewConstraint = bannerCollectionView.heightAnchor.constraint(equalToConstant: 115)
        heightBannerCollectionViewConstraint?.isActive = true
    }
}

extension MainViewController: MainViewDelegate {
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.menuListTableView.reloadData()
        }
    }
}
