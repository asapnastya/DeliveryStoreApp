//
//  BannerCell.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import Foundation
import UIKit

class BannerCell: UICollectionViewCell {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "BannerCell"
    
    var model : BannerModel? {
        didSet {
            guard let model = model else {return}
            
            bannerImage.image = UIImage(named: model.image)
        }
    }
    
// MARK: - UI
    private lazy var bannerImage : UIImageView = {
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

// MARK: - BannerCell
extension BannerCell {
    
    func configure() {
        contentView.backgroundColor = .clear
    }
    
    func setupLayout() {
        contentView.addSubview(bannerImage)
        
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
