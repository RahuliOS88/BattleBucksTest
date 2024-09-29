//
//  ImageCellView.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI

struct ImageCellView: View {
    // The photo data to be displayed in the cell.
    let photo: ImageData?
    // The width of the cell, used for layout purposes.
    let cellWidth: CGFloat

    var body: some View {
        ZStack {
            // Horizontal stack to layout the image and text vertically.
            HStack {
                // RemoteImageView is a custom view for loading and displaying an image from a URL.
                RemoteImageView(url: URL(string: photo?.thumbnailUrl ?? "")!)
                    .clipped() // Ensures the image doesn't overflow its frame.
            }
            .background(Color.white) // Sets the background color of the HStack to white.
            .listBackground() // Custom modifier to set the background of the list item (defined elsewhere).
        }
    }
}

#Preview {
    ImageCellView(photo: ImageData(albumId: 1, id: 1, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "accusamus beatae ad facilis cum similique qui sunt", url: "https://via.placeholder.com/600/92c952"), cellWidth: 100)
}
