//
//  Item.swift
//  SephoraDemo
//
//  Created by Aladdin HOUAS on 06/01/2024.
//

import Foundation

struct StoreItem : Codable {
    let productId : Int?
    let productName : String?
    let description : String?
    let price : Double?
    let imagesUrl : ImagesUrl?
    let cBrand : CBrand?
    let isProductSet : Bool?
    let isSpecialBrand : Bool?
    
    enum CodingKeys: String, CodingKey {

        case productId = "product_id"
        case productName = "product_name"
        case description = "description"
        case price = "price"
        case imagesUrl = "images_url"
        case cBrand = "c_brand"
        case isProductSet = "is_productSet"
        case isSpecialBrand = "is_special_brand"
    }
}
