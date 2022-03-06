//
//  Product.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import Foundation


class Product {
    var imageURL: URL!
    var name: String!
    var price: Double!
    var size: Character!
    
    
    init(_ name:String, price: Double, size: Character, imageURL: URL){
        self.imageURL = imageURL
        self.name = name
        self.price = price
        self.size = size
    }
    
}
