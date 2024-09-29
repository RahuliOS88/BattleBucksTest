//
//  ImageDetailsViewModel.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 28/09/24.
//

import SwiftUI
import Combine

class ImageDetailsViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    var images: [ImageData] = []

    init(images: [ImageData], currentIndex: Int) {
        self.images = images
        self.currentIndex = currentIndex
    }
    
    //For navigating to previous image
    func nextImage() {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
    }
    
    //For navigating to previous image
    func previousImage() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
}
