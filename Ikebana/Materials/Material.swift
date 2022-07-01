//
//  Material.swift
//  Ikebana
//
//  Created by CYAN on 2022/01/26.
//

import Foundation

class Material {
    var id: String!
    var japaneseName: String!
    var englishName: String!
    var imageName: String!
    var isFavorited: Bool!
    
    init(japaneseName: String, englishName: String, id: String, isFavorited: Bool = false) {
        self.id = id
        self.japaneseName = japaneseName
        self.englishName = englishName
        self.imageName = id
        self.isFavorited = isFavorited
    }
}
