//
//  RemoteImageView.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI

// A SwiftUI view for displaying an image loaded from a remote URL.
// Shows a loading spinner while the image is being fetched.
struct RemoteImageView: View {
    // StateObject to manage the lifecycle and state of the ImageLoader.
    @ObservedObject private var imageLoader: ImageLoader

    // Initializer that takes a URL and creates an ImageLoader to fetch the image.
    init(url: URL) {
        _imageLoader = ObservedObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        // Conditional view rendering based on whether the image has been loaded.
        if let image = imageLoader.image {
            // Display the image if it has been successfully loaded.
            Image(uiImage: image)
                .resizable() // Allows the image to be resized.
                .cornerRadius(10)
//                .aspectRatio(contentMode: .fill) // Ensures the image fills its container while maintaining its aspect ratio.
        } else {
            // Show a loading spinner while the image is being fetched.
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle()) // Applies a circular style to the progress indicator.
        }
    }
}

