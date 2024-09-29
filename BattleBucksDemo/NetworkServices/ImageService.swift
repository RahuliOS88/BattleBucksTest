//
//  ImageService.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 29/09/24.
//

import Foundation
import Combine

final class ImageService: ImageServiceProtocol {
    func fetchImages() -> AnyPublisher<[ImageData], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [ImageData].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
