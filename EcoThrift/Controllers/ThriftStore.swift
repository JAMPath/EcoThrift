//
//  ThriftStore.swift
//  EcoThrift
//
//  Created by Jonathan Ballona Sanchez on 3/5/22.
//

import Foundation
//import AlamofireImage


class ThriftStore {
    
    
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var coordinates: [String:Double]
    
    
    init() {
        imageURL = URL(string: "https://bloximages.newyork1.vip.townnews.com/coladaily.com/content/tncms/assets/v3/editorial/9/dc/9dc9187c-2843-11ec-9c79-178ac956285c/616054e5a770e.image.jpg?resize=666%2C500" )
        name = "GoodWill" as! String
        phone = "555-555-555" as! String
        url = URL(string: "https://shopgoodwill.com/home")
        mainCategory = "Sales"
    // coordinates of merced, ca
        coordinates = ["longitude": -122.5, "latitude": 37.8]
    }
    
}
