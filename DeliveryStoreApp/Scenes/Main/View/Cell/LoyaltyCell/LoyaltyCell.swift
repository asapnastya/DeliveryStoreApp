//
//  ProductCell.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import UIKit

class LoyaltyCell: UICollectionViewCell {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "LoyaltyCell"

    var model : LoyaltyModel? {
        didSet {
            guard let model = model else { return }
            
            setupNumberOfBonusesText(with: model.numberOfBonuses)
            loyaltyImage.image = UIImage(named: model.image)
            
        }
    }
        
// MARK: - UI
    private lazy var loyaltyImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var numberOfBonusesLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    
    private func setupNumberOfBonusesText(with numberOfBonuses: Int) {
        let mainFont = UIFont.boldSystemFont(ofSize: 36)
        let smallerFont = UIFont.boldSystemFont(ofSize: 17)
        
        let attributedText = NSMutableAttributedString()
        
        let numberOfBonusesText = NSAttributedString(
            string: "\(numberOfBonuses)",
            attributes: [
                .font: mainFont,
                .foregroundColor: UIColor.red
            ]
        )
        
        attributedText.append(numberOfBonusesText)
        
        let wordBonusesText = NSAttributedString(string: "  бонусов", attributes: [
            .font: smallerFont,
            .foregroundColor: UIColor.red
        ])
        
        attributedText.append(wordBonusesText)
        
        numberOfBonusesLabel.attributedText = attributedText
    }
}
    
// MARK: - LoyaltyCell
extension LoyaltyCell {
    
    func configure() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
    
    func setupLayout() {
        contentView.addSubview(loyaltyImage)
        contentView.addSubview(numberOfBonusesLabel)
        
        NSLayoutConstraint.activate([
            loyaltyImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            loyaltyImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loyaltyImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loyaltyImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            numberOfBonusesLabel.topAnchor.constraint(equalTo: loyaltyImage.topAnchor,constant: -18),
            numberOfBonusesLabel.bottomAnchor.constraint(equalTo: loyaltyImage.bottomAnchor,constant: -36),
            numberOfBonusesLabel.leadingAnchor.constraint(equalTo: loyaltyImage.leadingAnchor, constant: 18),
            numberOfBonusesLabel.trailingAnchor.constraint(equalTo: loyaltyImage.trailingAnchor)
        ])
    }
}
