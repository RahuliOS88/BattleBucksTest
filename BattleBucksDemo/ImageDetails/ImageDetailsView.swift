//
//  ImageDetailsView.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 28/09/24.
//

import SwiftUI

struct ImageDetailsView: View {
    @ObservedObject var viewModel: ImageDetailsViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack {
                    // Current image
                    RemoteImageView(url: URL(string: viewModel.images[viewModel.currentIndex].url ?? "")!)
                        .frame(width: geometry.size.width, height: geometry.size.height + 140)
                        .edgesIgnoringSafeArea(.all)
                        .animation(.easeInOut, value: viewModel.currentIndex)
             
                    VStack(alignment: .leading) {
                        let title = viewModel.images[viewModel.currentIndex].title ?? ""
                        let capitalizedTitle = title.prefix(1).uppercased() + title.dropFirst().lowercased()
                        
                        Text(capitalizedTitle)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.top, 400) // Adjust as needed
                            .padding(.horizontal) // Add horizontal padding
                    }
                }
            }
            .gesture(DragGesture()
                .onEnded { value in
                    let threshold: CGFloat = 25 // Sensitivity threshold
                    if abs(value.translation.width) > threshold {
                        withAnimation {
                            if value.translation.width < 0 { // Swiped left
                                viewModel.nextImage()
                            } else if value.translation.width > 0 { // Swiped right
                                viewModel.previousImage()
                            }
                        }
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss() // Custom back action
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .tint(.white)// Back arrow
                Text("") // Empty text to remove title
            }
        })
    }
}

#Preview {
    ImageDetailsView(viewModel: ImageDetailsViewModel(images: [
        ImageData(albumId: 1, id: 1, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 1", url: "https://via.placeholder.com/600/92c952"),
        ImageData(albumId: 1, id: 2, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 2", url: "https://via.placeholder.com/600/92c952"),
        ImageData(albumId: 1, id: 3, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 3", url: "https://via.placeholder.com/600/92c952"),
        ImageData(albumId: 1, id: 4, thumbnailUrl: "https://via.placeholder.com/150/92c952", title: "Image 4", url: "https://via.placeholder.com/600/92c952")
    ], currentIndex: 0))
}
