//
//  APIMock.swift
//  MoviesDisplayerTests
//
//  Created by Mauro Romito on 01/06/21.
//

import Combine
import Foundation

@testable import MoviesDisplayer

enum MockError: Error {
    case mockError
}

class APIMock: MoviesSearchAPIClient {
    var isErrorTest: Bool = false
    
    func search(query: String, page: Int) -> AnyPublisher<SearchResponse, Error> {
        if isErrorTest {
            return Fail(error: MockError.mockError)
                .eraseToAnyPublisher()
        } else {
            let bundle = Bundle(for: type(of: self))
            let url = bundle.url(forResource: "validResponse", withExtension: "json")!
            let json = try! Data(contentsOf: url)
            let response = try! JSONDecoder().decode(SearchResponse.self, from: json)
            return Just(response)
                .mapError { _ in
                    return MockError.mockError
                }
                .eraseToAnyPublisher()
        }
    }
    
    
}
