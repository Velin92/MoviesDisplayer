//
//  APIClient.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 01/06/21.
//
import Combine
import Foundation

import Alamofire

protocol MoviesSearchAPIClient {
    func search(query: String, page: Int) -> AnyPublisher<SearchResponse, Error>
}

class APIClient {
    
    private func request<T: Decodable> (_ urlConvertible: URLRequestConvertible) -> AnyPublisher<T, Error> {
        AF.request(urlConvertible).publishDecodable(type: T.self, decoder: JSONDecoder())
            .tryCompactMap { response in
                response.value
            }
            .eraseToAnyPublisher()
    }
}

extension APIClient: MoviesSearchAPIClient {
    func search(query: String, page: Int) -> AnyPublisher<SearchResponse, Error> {
        let searchRequest = SearchRequest(query: query, page: page)
        let urlRequest = APIRouter.searchMovie(request: searchRequest)
        return request(urlRequest)
    }
}
