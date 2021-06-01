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
    @Published var cellAdapters: [ReusableViewModelAdapter] = []
    @Published var isShowingError = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    let searchClient: MoviesSearchAPIClient
    
    init(searchClient: MoviesSearchAPIClient) {
        self.searchClient = searchClient
        $searchInput.debounce(for: .seconds(1.0), scheduler: RunLoop.main)
            .sink { [weak self] input in
                guard !input.isEmpty else {return}
                self?.fetch(input: input)
            }
            .store(in: &cancellables)
    }
    
    private func fetch(input: String) {
        searchClient.search(query: input, page: 1)
            .map { response -> [ReusableViewModelAdapter] in
                guard let movies = response.results else {return []}
                return movies.map { MovieCellViewModel(model: $0).adapted(hashable: $0)}
            }
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure:
                    self?.isShowingError = true
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] adapters in
                self?.cellAdapters = adapters
            })
            .store(in: &cancellables)
    }
}
