//
//  ContentView.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

struct MoviesSearchView: View {
    @ObservedObject var viewModel: MoviesSearchViewModel
    
    var body: some View {
        VStack {
            MoviesSearchBar(searchInput: $viewModel.searchInput)
            List(viewModel.cellAdapters) { cellAdapter in
                if let movieCellViewModel = cellAdapter.reusableViewModel as? MovieCellViewModel {
                   MovieCellView(viewModel:movieCellViewModel)
                }
            }
        }
        .alert(isPresented: $viewModel.isShowingError, content: {
            Alert(title: Text("Error"),
                  message: Text("Please check again your internet connection"))
        })
    }
}

struct MoviesSearchView_Previews: PreviewProvider {
    static let viewModel = MoviesSearchViewModel(searchClient: APIClient())
    
    static var previews: some View {
        MoviesSearchView(viewModel: viewModel)
    }
}
