//
//  ImageCache.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import UIKit

// A singleton class for caching images.
class ImageCache {
    // The shared instance of ImageCache
    static let shared = ImageCache()

    // Internal cache using NSCache to store UIImage objects keyed by NSURL.
    private var cache = NSCache<NSURL, UIImage>()

    // Retrieves an image from the cache using the provided URL.
    // Returns an optional UIImage if the image exists in the cache.
    func image(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    // Stores an image in the cache with the provided URL as the key.
    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}

