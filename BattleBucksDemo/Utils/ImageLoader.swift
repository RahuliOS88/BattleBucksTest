//
//  ImageLoaded.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI
import Combine
import UIKit

// An ObservableObject class responsible for loading and caching images asynchronously.
class ImageLoader: ObservableObject {
    // Published property to notify observers of changes to the image.
    @Published var image: UIImage? = nil

    // Cancellable to manage the lifecycle of the network request.
    private var cancellable: AnyCancellable?

    // URL of the image to be loaded.
    private let url: URL

    // Initializer that takes a URL and starts loading the image.
    init(url: URL) {
        self.url = url
        loadImage() // Call the method to start loading the image.
    }

    // Method to load the image from cache or network.
    private func loadImage() {
        // Check if the image is already cached.
        if let cachedImage = ImageCache.shared.image(for: url) {
            self.image = cachedImage // Use the cached image if available.
            return
        }

        // Perform network request to fetch the image if not cached.
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Extract data from the URLSession response.
            .compactMap(UIImage.init) // Convert data to UIImage.
            .receive(on: DispatchQueue.main) // Ensure updates are on the main thread.
            .sink(receiveCompletion: { _ in
                // Handle errors here if needed (e.g., log error, show error UI).
            }, receiveValue: { [weak self] image in
                // Cache the fetched image and update the published property.
                ImageCache.shared.setImage(image, for: self?.url ?? URL(string: "")!)
                self?.image = image
            })
    }
}
