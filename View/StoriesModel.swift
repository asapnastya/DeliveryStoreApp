//
//  CategoryModel.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import Foundation

// MARK: - StoriesModel
struct StoriesModel {

    let image: String
    let name: String?
}

let storiesMockData = [
    StoriesModel(image: "SparIcon", name: "Привелегии «Мой SPAR»"),
    StoriesModel(image: "PaperPlane", name: "Мы в соцсетях"),
    StoriesModel(image: "Coctail", name: "3 рецепта коктейлей"),
    StoriesModel(image: "WomenEat", name: "Дегустации в SPAR"),
    StoriesModel(image: "NewProduct", name: "Новинки недели"),
    StoriesModel(image: "TryBest", name: "Откройте вкус"),
]
