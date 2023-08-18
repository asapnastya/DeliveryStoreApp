//
//  CategoryCell.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import Foundation
import UIKit

// MARK: - StoriesCell
final class StoriesCell: UICollectionViewCell {
    
// MARK: - cellIdentifier
    static let cellIdentifier = "StoriesCell"
    
    var model: StoriesModel? {
        didSet {
            guard let model = model else { return }
            
            imageView.image = UIImage(named: model.image)
            nameLabel.text = model.name
        }
    }

// MARK: - UIViews
    private lazy var storiesContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.systemGreen.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 9)
        label.textColor = .black
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

// MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configure()
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configure()
        self.setupLayout()
    }

// MARK: - Draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.storiesContainer.layer.cornerRadius = self.storiesContainer.frame.width / 2
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
    }
}

// MARK: - StoriesCell
extension StoriesCell {

    func configure() {
        self.backgroundColor = .clear
    }

    func setupLayout() {
        contentView.addSubview(storiesContainer)
        contentView.addSubview(nameLabel)
        
        storiesContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            storiesContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            storiesContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storiesContainer.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
            storiesContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: storiesContainer.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: storiesContainer.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: storiesContainer.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: storiesContainer.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: storiesContainer.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
