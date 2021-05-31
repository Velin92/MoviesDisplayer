//
//  ContentView.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

struct MoviesSearchView: View {
    @ObservedObject var viewModel = MoviesSearchViewModel()
    
    var body: some View {
        VStack {
            MoviesSearchBar(searchInput: $viewModel.searchInput)
            List {
                
            }
        }
    }
}

struct MoviesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearchView()
    }
}
