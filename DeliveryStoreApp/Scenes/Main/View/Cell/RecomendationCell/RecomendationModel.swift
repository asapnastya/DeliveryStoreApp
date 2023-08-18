//
//  RecomendationModel.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/16/23.
//

import Foundation

// MARK: - RecomendationModel
struct RecomendationModel {
    
    let image: String
    let textBadge: String?
    let price: String
    let oldPrice: String?
    
    init(
        image: String,
        textBadge: String = "",
        price: String,
        oldPrice: String = ""
    ) {
        self.image = image
        self.textBadge = textBadge
        self.price = price
        self.oldPrice = oldPrice
    }
}

let recomendationsMockData = [
    RecomendationModel(image: "Lamber", price: "199.90", oldPrice: "489.00"),
    RecomendationModel(image: "Evervess", textBadge: "Супер Цена", price: "99.90"),
    RecomendationModel(image: "Zewa", textBadge: "Удар по ценам", price: "309.90", oldPrice: "489.00"),
    RecomendationModel(image: "TomYum", price: "67.30")
]

let sweetOffersMockData = [
    RecomendationModel(image: "Sorbet1", price: "99.90"),
    RecomendationModel(image: "Sorbet2", price: "99.90"),
    RecomendationModel(image: "Sorbet3", price: "99.90"),
    RecomendationModel(image: "Sorbet4", price: "199.90")
]
