//
//  ProductsListService.swift
//  SephoraDemo
//
//  Created by solinum.dev on 08/01/2024.
//

import Foundation

class ProductsListService {
    
    static let shared = ProductsListService()
    
     func fetchProductList(completion: @escaping (Error?,[StoreItem]?) -> Void) {
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
                completion(error, nil)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print(data)
                    let decoder = JSONDecoder()
                    if let items = try? decoder.decode([StoreItem].self, from: data) {
                        completion(nil, items)
                    }
                } else {
                    completion(nil, nil)
                }
            }
        }
        
        task.resume()
    }
    
    
}

