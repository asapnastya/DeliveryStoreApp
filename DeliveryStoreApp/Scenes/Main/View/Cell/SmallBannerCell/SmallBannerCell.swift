//
//  SmallBannerCell.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/16/23.
//

import Foundation
import UIKit

class SmallBannerCell: UICollectionViewCell {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "SmallBannerCell"
    
    var model : SmallBannerModel? {
        didSet {
            guard let model = model else { return }
            
            smallBannerImage.image = UIImage(named: model.image)
        }
    }
    
// MARK: - UI
    private lazy var smallBannerImage : UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
// MARK: - Init
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
}

// MARK: - SmallBannerCell
extension SmallBannerCell {
    
    func configure() {
        contentView.backgroundColor = .clear
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
    
    func setupLayout() {
        contentView.addSubview(smallBannerImage)
        
        NSLayoutConstraint.activate([
            smallBannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            smallBannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            smallBannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            smallBannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
