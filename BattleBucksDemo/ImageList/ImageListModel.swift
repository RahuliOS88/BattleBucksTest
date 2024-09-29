//
//  ImageListModel.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 28/09/24.
//

// This struct represents an individual image.
// It conforms to Codable to enable easy encoding and decoding,
// and Identifiable to provide a unique identifier for each image.
struct ImageData : Codable, Identifiable {
    let albumId : Int?
    let id : Int?
    let thumbnailUrl : String?
    let title : String?
    let url : String?
}
