//
//  NetworkManager.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/26/23.
//

import Foundation
import UIKit

class NetworkManager {
    
    func getDataFromURL(url: URL) async throws -> Data {
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            print(error.localizedDescription)
            throw error
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


    


