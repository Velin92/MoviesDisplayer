//
//  MovieCellViewModel.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

struct MovieCellViewModel: ReusableViewModel {
    let imageUrl: String
    let title: String
    let vote: Float
    
    var voteString: String {
        return "Vote: \(vote)/10"
    }
}
