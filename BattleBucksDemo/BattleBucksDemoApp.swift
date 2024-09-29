//
//  BattleBucksDemoApp.swift
//  BattleBucksDemo
//
//  Created by Satendra Maurya on 27/09/24.
//

import SwiftUI

@main
struct BattleBucksDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ImageListView(viewModel: ImageListViewModel())
        }
    }
}
