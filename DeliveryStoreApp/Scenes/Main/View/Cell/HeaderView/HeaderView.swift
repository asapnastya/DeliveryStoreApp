//
//  HeaderView.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import UIKit

// MARK: - HeaderView
final class HeaderView: UIView {

// MARK: - UI
   private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
       
        imageView.image = UIImage(named: "Location")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var locationContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "Menu"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        
        cityLabel.text = .cityTitle
        cityLabel.font = .systemFont(ofSize: 13.5)
        cityLabel.textColor = .black
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return cityLabel
    }()

// MARK: - Configure
    internal func configure() -> Self {
        setupLayout()

        backgroundColor = .systemBackground

        return self
    }

// MARK: - SetupLayout
    private func setupLayout() {
        addSubview(locationContainer)
        addSubview(menuButton)
        
        locationContainer.addSubview(locationImageView)
        locationContainer.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            locationContainer.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            locationContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            locationContainer.heightAnchor.constraint(equalToConstant: 35),
            locationContainer.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -5),
            
            locationImageView.topAnchor.constraint(equalTo: locationContainer.topAnchor, constant: 5),
            locationImageView.bottomAnchor.constraint(equalTo: locationContainer.bottomAnchor,constant: -5),
            locationImageView.leadingAnchor.constraint(equalTo: locationContainer.leadingAnchor, constant: 10),
            locationImageView.heightAnchor.constraint(equalToConstant: 30),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            cityLabel.topAnchor.constraint(equalTo: locationContainer.topAnchor, constant: 5),
            cityLabel.bottomAnchor.constraint(equalTo: locationContainer.bottomAnchor,constant: -5),
            cityLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10),
            cityLabel.trailingAnchor.constraint(lessThanOrEqualTo: locationContainer.trailingAnchor, constant: -16),
            
            menuButton.centerYAnchor.constraint(equalTo: locationContainer.centerYAnchor),
            menuButton.leadingAnchor.constraint(equalTo: locationContainer.trailingAnchor, constant: 5),
            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            menuButton.heightAnchor.constraint(equalToConstant: 23),
            menuButton.widthAnchor.constraint(equalToConstant: 23),
        ])
    }
}

// MARK: - String
extension String {
    
    static let cityTitle = "Москва, Москва и Московская область"
}
