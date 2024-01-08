//
//  ItemsViewModel.swift
//  SephoraDemo
//
//  Created by Aladdin HOUAS on 07/01/2024.
//

import Foundation
import RxSwift
import RxCocoa

class ItemsViewModel {
    
    let service: ProductsListService?
    var items = PublishSubject<[StoreItem]>()
    
    init(service: ProductsListService = ProductsListService.shared) {
        self.service = service
    }
    
    func fetchProductList() {
        service?.fetchProductList {error, items in
            if let items {
                let sortedItems = items.sorted { $0.isSpecialBrand ?? false && !($1.isSpecialBrand ?? false) }
                self.items.onNext(sortedItems)
                self.items.onCompleted()
            } else if let error {
                print(error)
            }
        }
    }
}
