//
//  ReusableViewModel.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

protocol ReusableViewModel {}

extension ReusableViewModel {
    func adapted<H: Hashable>(hashable: H) -> ReusableViewViewModelAdapter {
        .init(hashable: hashable, reusableViewViewModel: self)
    }
}
