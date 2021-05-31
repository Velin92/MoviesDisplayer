//
//  MovieCellView.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

struct MovieCellView: View {
    
    @State var viewModel: MovieCellViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: Data()) ?? UIImage())
            VStack {
                Text(viewModel.title)
                Text(viewModel.voteString)
            }
        }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static let viewModel = MovieCellViewModel(imageUrl: "", title: "Test", vote: 5)
    
    static var previews: some View {
        MovieCellView(viewModel: viewModel)
    }
}
