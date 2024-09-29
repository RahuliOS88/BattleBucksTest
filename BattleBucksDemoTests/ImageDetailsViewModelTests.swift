//
//  ImageDetailsViewModelTests.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 29/09/24.
//

import XCTest
@testable import BattleBucksDemo

class ImageDetailsViewModelTests: XCTestCase {
    var viewModel: ImageDetailsViewModel!
    var sampleImages: [ImageData]!

    override func setUp() {
        super.setUp()
        // Mock images for testing
        sampleImages = [
            ImageData(albumId: 1, id: 1, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 1", url: "https://via.placeholder.com/600/92c952"),
            ImageData(albumId: 1, id: 2, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 2", url: "https://via.placeholder.com/600/92c952"),
            ImageData(albumId: 1, id: 3, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 3", url: "https://via.placeholder.com/600/92c952")
        ]
        // Assuming ImageData is a valid model
        viewModel = ImageDetailsViewModel(images: sampleImages, currentIndex: 0)
    }

    override func tearDown() {
        viewModel = nil
        sampleImages = nil
        super.tearDown()
    }

    func testInitialValues() {
        XCTAssertEqual(viewModel.currentIndex, 0)
        XCTAssertEqual(viewModel.images.count, sampleImages.count)
    }

    func testNextImage() {
        viewModel.nextImage()
        XCTAssertEqual(viewModel.currentIndex, 1)

        viewModel.nextImage() // Move to index 2
        XCTAssertEqual(viewModel.currentIndex, 2)

        viewModel.nextImage() // Should not exceed the bounds
        XCTAssertEqual(viewModel.currentIndex, 2)
    }

    func testPreviousImage() {
        // Start at index 2
        viewModel = ImageDetailsViewModel(images: sampleImages, currentIndex: 2)

        viewModel.previousImage()
        XCTAssertEqual(viewModel.currentIndex, 1)

        viewModel.previousImage() // Move to index 0
        XCTAssertEqual(viewModel.currentIndex, 0)

        viewModel.previousImage() // Should not go below 0
        XCTAssertEqual(viewModel.currentIndex, 0)
    }
}
