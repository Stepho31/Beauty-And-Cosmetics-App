//
//  ImageCache.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/27/23.
//

import Foundation

final class ImageCache {
    
    static let shared = ImageCache()
    
    private var cache: NSCache<NSString, NSData> = NSCache<NSString, NSData>()
    
    private init() { }
    
}

extension ImageCache {
    
    func getImageData(key: String) -> Data? {
        let nsKey = NSString(string: key)
        guard let object = self.cache.object(forKey: nsKey) else { return nil }
        return Data(referencing: object)
    }
    
    func setImageData(key: String, data: Data) {
        let nsKey = NSString(string: key)
        let object = NSData(data: data)
        self.cache.setObject(object, forKey: nsKey)
    }
    
    
}
