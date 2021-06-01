//
//  APIClient.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 01/06/21.
//
import Combine
import Foundation

import Alamofire

enum APIError: Error {
    case missingResponse
}

protocol MoviesSearchAPIClient {
    func search(query: String, page: Int) -> AnyPublisher<SearchResponse, Error>
}

class APIClient {
    
    private func request<T: Decodable> (_ urlConvertible: URLRequestConvertible) -> AnyPublisher<T, Error> {
        AF.request(urlConvertible).publishDecodable(type: T.self, decoder: JSONDecoder())
            .tryMap { response in
                if let error = response.error {
                    throw error
                } else if let value = response.value {
                    return value
                } else {
                    throw APIError.missingResponse
                }
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
