//
//  MoviesDisplayerApp.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

@main
struct MoviesDisplayerApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesSearchView(viewModel: MoviesSearchViewModel(searchClient: APIClient()))
        }
    }
}
