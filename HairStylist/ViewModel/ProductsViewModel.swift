//
//  ProductsViewModel.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/26/23.
//

import Foundation

class ProductsViewModel {
    //MARK: Make webkit URL
    var selectedProductURL: URL?
    
    var products: [Products] = [] {
        
        didSet {
            updateUI?()
        }
        
    }
    
    var updateUI: (()->())?
    
    func getProducts(url: String) {
        Task {
            let networkManager = NetworkManager()
            
            guard let url = URL(string: url) else {
                return
            }
            do {
                let apiData = try await networkManager.getDataFromURL(url: url)
                let parsedData = try JSONDecoder().decode([Products].self, from: apiData)
                
                
                print(parsedData)
                products = parsedData.self
                
                
            } catch let error {
                print(error)
            }
        }
    }
    
    
//    //MARK: Argument representing the product id and returns the website link for the product with that id. If no product is found with the given id, nil is returned
//    func getWebsiteLink(forProductWithId productId: Int) -> String? {
//         return products.first(where: { $0.id == productId })?.websiteLink
//     }
}
