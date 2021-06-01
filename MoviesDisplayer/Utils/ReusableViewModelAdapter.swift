//
//  ReusableViewModelAdapter.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

struct ReusableViewModelAdapter: Hashable, Identifiable {
    
    let id: AnyHashable
    let reusableViewModel: ReusableViewModel

    init<H: Hashable>(hashable: H, reusableViewModel: ReusableViewModel) {
        self.id = AnyHashable(hashable)
        self.reusableViewModel = reusableViewModel
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
