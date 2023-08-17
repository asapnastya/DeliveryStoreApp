//
//  RecomendationCell.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/16/23.
//

import UIKit

class RecomendationCell: UICollectionViewCell {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "RecomendationCell"
    
    private var priceContainerToOldPriceConstraint: NSLayoutConstraint?
    
    var model: RecomendationModel? {
        didSet {
            guard let model = model else { return }
            
            productImage.image = UIImage(named: model.image)
            
            self.setPriceAdjustDecimal(model.price)
            
            if !(model.oldPrice?.isEmpty ?? false) {
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: model.oldPrice ?? "")
                attributeString.addAttribute(
                    .strikethroughStyle,
                    value: 2,
                    range: .init(location: .zero, length: attributeString.length)
                )
                
                oldPriceLabel.attributedText = attributeString
                
                setupConstraintsWithOldPrice()
            }
            
            if !(model.textBadge?.isEmpty ?? false) {
                badgeLabel.text = model.textBadge
                
                setupConstraintsBadge()
            }
        }
    }

// MARK: - UI
    private lazy var recomendationContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var productImage : UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var cartButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "CartButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var priceContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 13.5)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var priceForPieceImage : UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "RublesPiece")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var badgeContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemPink
        view.alpha = 0.5
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var badgeLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
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
    
// MARK: - Private methods
    private func setPriceAdjustDecimal(_ fullPrice: String) {
        if let range = fullPrice.range(of: ".") {
            let dotIndex = fullPrice.distance(from: fullPrice.startIndex, to: range.lowerBound)
            let attributedText = NSMutableAttributedString(string: fullPrice)
            let startIndex = fullPrice.index(fullPrice.startIndex, offsetBy: dotIndex + 1)
            let nsRange = NSRange(startIndex..., in: fullPrice)
            
            attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], range: nsRange)
            priceLabel.attributedText = attributedText
        } else {
            priceLabel.text = fullPrice
        }
    }
    
    private func setupConstraintsWithOldPrice() {
        recomendationContainer.addSubview(oldPriceLabel)
        
        NSLayoutConstraint.deactivate([
            priceContainerToOldPriceConstraint ?? NSLayoutConstraint.init()
        ])
        
        NSLayoutConstraint.activate([
            oldPriceLabel.topAnchor.constraint(equalTo: priceContainer.bottomAnchor),
            oldPriceLabel.bottomAnchor.constraint(equalTo: recomendationContainer.bottomAnchor, constant: -2),
            oldPriceLabel.leadingAnchor.constraint(equalTo: recomendationContainer.leadingAnchor, constant: 4),
            oldPriceLabel.trailingAnchor.constraint(lessThanOrEqualTo: recomendationContainer.trailingAnchor, constant: 1),
            
            priceContainer.bottomAnchor.constraint(equalTo: oldPriceLabel.topAnchor, constant: -1)
        ])
    }
    
    private func setupConstraintsBadge() {
        recomendationContainer.addSubview(badgeContainer)
        badgeContainer.addSubview(badgeLabel)
        
        NSLayoutConstraint.activate([
            badgeContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            badgeContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -4),
            badgeContainer.trailingAnchor.constraint(equalTo: badgeLabel.trailingAnchor, constant: 4),
            badgeContainer.heightAnchor.constraint(equalToConstant: 20),
            
            badgeLabel.centerYAnchor.constraint(equalTo: badgeContainer.centerYAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            badgeLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)
        ])
    }
}

// MARK: - RecomendationCell
extension RecomendationCell {
    
    func configure() {
        contentView.backgroundColor = .clear
        
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }
    
    func setupLayout() {
        contentView.addSubview(self.recomendationContainer)
        
        recomendationContainer.addSubview(productImage)
        recomendationContainer.addSubview(cartButton)
        recomendationContainer.addSubview(priceContainer)
        
        priceContainer.addSubview(priceLabel)
        priceContainer.addSubview(priceForPieceImage)
        
        
        priceContainerToOldPriceConstraint = priceContainer.bottomAnchor.constraint(equalTo: recomendationContainer.bottomAnchor, constant: -4)
        
        NSLayoutConstraint.activate([
            recomendationContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            recomendationContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recomendationContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            recomendationContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            productImage.topAnchor.constraint(equalTo: recomendationContainer.topAnchor, constant: 4),
            productImage.leadingAnchor.constraint(equalTo: recomendationContainer.leadingAnchor, constant: 4),
            productImage.trailingAnchor.constraint(equalTo: recomendationContainer.trailingAnchor, constant: -4),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
            
            priceContainer.topAnchor.constraint(equalTo: productImage.bottomAnchor),
            priceContainerToOldPriceConstraint ?? NSLayoutConstraint.init(),
            priceContainer.leadingAnchor.constraint(equalTo: recomendationContainer.leadingAnchor, constant: 4),
            priceContainer.trailingAnchor.constraint(lessThanOrEqualTo: cartButton.leadingAnchor, constant: -4),
            
            priceLabel.topAnchor.constraint(equalTo: priceContainer.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceContainer.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceContainer.leadingAnchor),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: priceForPieceImage.leadingAnchor, constant: -1),
            
            priceForPieceImage.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            priceForPieceImage.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            priceForPieceImage.trailingAnchor.constraint(lessThanOrEqualTo: priceContainer.trailingAnchor),
            priceForPieceImage.heightAnchor.constraint(equalToConstant: 20),
            priceForPieceImage.widthAnchor.constraint(equalToConstant: 20),
            
            cartButton.centerYAnchor.constraint(equalTo: priceContainer.centerYAnchor),
            cartButton.leadingAnchor.constraint(equalTo: recomendationContainer.trailingAnchor, constant: 4),
            cartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            cartButton.heightAnchor.constraint(equalToConstant: 40),
            cartButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
