//
//  Item.swift
//  SephoraDemo
//
//  Created by Aladdin HOUAS on 06/01/2024.
//

import Foundation

struct StoreItem : Codable {
    let product_id : Int?
    let product_name : String?
    let description : String?
    let price : Double?
    let images_url : ImagesUrl?
    let c_brand : CBrand?
    let is_productSet : Bool?
    let is_special_brand : Bool?
}
