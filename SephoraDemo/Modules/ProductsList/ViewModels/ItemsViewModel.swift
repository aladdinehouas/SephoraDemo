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
    
    var items = PublishSubject<[StoreItem]>()
    
    func fetchProductList() {
        let url = URL(string: "https://sephoraios.github.io/items.json")!
        var urlRequest = URLRequest(url: url)
        
       // Load from the cache
        urlRequest.cachePolicy = .returnCacheDataDontLoad

        // Load from the source
        if NetworkMonitor.shared.isReachable {
            urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print(data)
                    let decoder = JSONDecoder()
                    if let items = try? decoder.decode([StoreItem].self, from: data) {
                        self.items.onNext(items)
                        self.items.onCompleted()
                        print(items)
                    }
                } else {
                    print("something went wrong")
                }
            }
        }
        
        task.resume()
    }
    
}
