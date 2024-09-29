//
//  ViewExtension.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI

// An extension to the View protocol that adds a custom background modifier for list items.
extension View {
    // A view modifier that applies a rounded rectangle border as the background of a view.
    func listBackground() -> some View {
        background(
            // Creates a rounded rectangle to be used as the background.
            RoundedRectangle(cornerRadius: 10, style: .circular)
                // Applies a stroke border with a light gray color and a specified line width.
                .strokeBorder(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

