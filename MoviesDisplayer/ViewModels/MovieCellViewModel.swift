//
//  MovieCellViewModel.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

struct MovieCellViewModel: ReusableViewModel {
    let imageUrl: URL?
    let title: String
    private let vote: Double?
    
    var voteString: String {
        guard let vote = vote else {
            return "Vote: N/A"
        }
        return "Vote: \(vote)/10"
    }
    
    init(model: Movie) {
        self.imageUrl = URL(string: "https://image.tmdb.org/t/p/original/\(model.posterPath ?? "")")
        self.title = model.title ?? ""
        self.vote = model.voteAverage
    }
    
    init(imageUrl: String, title: String, vote: Double) {
        self.imageUrl = URL(string: imageUrl)
        self.title = title
        self.vote = vote
    }
}
