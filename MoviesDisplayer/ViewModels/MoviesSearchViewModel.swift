//
//  MoviesSearchViewModel.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Combine
import Foundation

final class MoviesSearchViewModel: ObservableObject {
    @Published var searchInput = ""
}
