//
//  MovieCellView.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

import Kingfisher

struct MovieCellView: View {
    
    @State var viewModel: MovieCellViewModel
    
    var body: some View {
        HStack {
            KFImage(viewModel.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .leading)
            Spacer()
            VStack(alignment: .trailing) {
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
