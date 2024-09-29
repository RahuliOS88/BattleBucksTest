//
//  ImageListViewModelTests.swift
//  BattleBucksDemo
//
//  Created by Satendra Maurya on 29/09/24.
//

import XCTest
import Combine
@testable import BattleBucksDemo

class ImageListViewModelTests: XCTestCase {
    var viewModel: ImageListViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchImagesSuccess() {
        let mockService = MockImageService()
        mockService.mockImages = testImageData() // Provide test data
        viewModel = ImageListViewModel(imageService: mockService)
        
        let expectation = self.expectation(description: "Fetch images successfully")
        
        viewModel.$images
            .dropFirst() // Ignore the initial value
            .sink(receiveValue: { images in
                XCTAssertFalse(images.isEmpty, "Images array should not be empty after fetching.")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        viewModel.fetchImages()
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchImagesFailure() {
        // Arrange
        let mockService = MockImageService()
        mockService.shouldFail = true
        viewModel = ImageListViewModel(imageService: mockService)
        
        // Act
        viewModel.fetchImages()
        
        // Assert
        let expectation = self.expectation(description: "Wait for images to fetch")
        
        viewModel.$images
            .dropFirst() // Skip the initial empty state
            .sink(receiveValue: { images in
                XCTAssertEqual(images.count, 0, "Images should not be fetched on failure")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    private func testImageData() -> [ImageData] {
        return [
            ImageData(albumId: 1, id: 1, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 1", url: "https://via.placeholder.com/600/92c952"),
            ImageData(albumId: 1, id: 2, thumbnailUrl: "https://via.placeholder.com/150/771796", title: "Image 2", url: "https://via.placeholder.com/600/771796")
        ]
    }
}
