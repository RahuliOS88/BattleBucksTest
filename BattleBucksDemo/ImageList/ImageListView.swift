//
//  ContentView.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI

struct ImageListView: View {
    @ObservedObject var viewModel: ImageListViewModel
    @State private var selectedIndex: Int?
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Photos")
                .onAppear {
                    viewModel.fetchImages()
                }
        }
    }
    
    private var content: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.images.indices, id: \.self) { index in
                        let cellWidth = calculateCellWidth(totalWidth: geometry.size.width, numberOfColumns: columns.count, spacing: 16)
                        NavigationLink(destination: ImageDetailsView(viewModel: ImageDetailsViewModel(images: viewModel.images, currentIndex: index))) {
                            ImageCellView(photo: viewModel.images[index], cellWidth: cellWidth)
                                .contentShape(Rectangle()) // Make the cell fully tappable
                        }
                    }
                }
                .padding(.horizontal, 24) // Add padding to the left and right
            }
            .background(Color.white) // Light gray background for the ScrollView
        }
    }
    
    private func calculateCellWidth(totalWidth: CGFloat, numberOfColumns: Int, spacing: CGFloat) -> CGFloat {
        return (totalWidth - (CGFloat(numberOfColumns - 1) * spacing) - 48) / CGFloat(numberOfColumns) // Adjust for horizontal padding
    }
}


#Preview {
    ImageListView(viewModel: ImageListViewModel())
}
