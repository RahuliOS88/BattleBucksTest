//
//  MockImageService.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 29/09/24.
//

import Foundation
import Combine

class MockImageService: ImageServiceProtocol {
    var mockImages: [ImageData] = []
    var shouldFail: Bool = false
    
    func fetchImages() -> AnyPublisher<[ImageData], Error> {
        if shouldFail {
            return Fail(outputType: [ImageData].self, failure: NSError(domain: "TestError", code: -1, userInfo: nil))
                            .eraseToAnyPublisher()
        } else {
            return Just(mockImages)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
