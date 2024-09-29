//
//  ImageListViewModel.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 28/09/24.

import Foundation
import Combine

protocol ImageServiceProtocol {
    func fetchImages() -> AnyPublisher<[ImageData], Error>
}

final class ImageListViewModel: ObservableObject {
    
    // Published property to store and update the list of images
    @Published var images: [ImageData] = []
    
    // Set to hold cancellables for Combine publishers
    private var cancellables = Set<AnyCancellable>()
    private var imageService: ImageServiceProtocol
    
    init(imageService: ImageServiceProtocol = ImageService()) {
        self.imageService = imageService
    }
    
    // Function to fetch photos from the API
    func fetchImages() {
        imageService.fetchImages()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.images = []
                }
            }, receiveValue: { [weak self] images in
                self?.images = images
            })
            .store(in: &cancellables)
    }
}
