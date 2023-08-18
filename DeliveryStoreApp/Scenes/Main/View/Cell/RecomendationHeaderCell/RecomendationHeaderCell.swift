//
//  RecomendationHeader.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/17/23.
//

import UIKit

class RecomendationHeaderCell: UICollectionReusableView {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "RecomendationHeaderCell"
    
// MARK: - UI
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = .black
        
        return headerLabel
    }()
    
// MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
        setupLayout()
    }
    
// MARK: - Public methods
    func setTitle(title: String) {
        self.headerLabel.text = title
    }
}

// MARK: - RecomendationHeaderCell
extension RecomendationHeaderCell {
    
    func configure(){
        backgroundColor = .clear
    }
    
    func setupLayout() {
       addSubview(headerLabel)
        
        headerLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    }
}
