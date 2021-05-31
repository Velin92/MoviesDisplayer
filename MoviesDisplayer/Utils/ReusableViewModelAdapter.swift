//
//  ReusableViewModelAdapter.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

struct ReusableViewViewModelAdapter: Hashable {
    private let hashable: AnyHashable
    let reusableViewViewModel: ReusableViewModel

    init<H: Hashable>(hashable: H, reusableViewViewModel: ReusableViewModel) {
        self.hashable = AnyHashable(hashable)
        self.reusableViewViewModel = reusableViewViewModel
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashable == rhs.hashable
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashable)
    }
}
