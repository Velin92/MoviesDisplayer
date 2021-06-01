//
//  APIRouter.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import Foundation

import Alamofire

enum APIRouter: URLRequestConvertible {
    private enum HTTPHeaderField: String {
      case authentication = "Authorization"
      case contentType = "Content-Type"
      case acceptType = "Accept"
      case acceptEncoding = "Accept-Encoding"
    }

    private enum ContentType: String {
      case json = "application/json"
    }

    private enum Constants {
        static let baseURLPath = "https://api.themoviedb.org/3"
        static let apiKey = "5f37cedfbbb89e1bc95307f8a043d7c4"
    }
    
    case searchMovie(request: SearchRequest)
    
    var method: HTTPMethod {
        switch self {
        case .searchMovie:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .searchMovie:
            return "/search/movie"
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURLPath.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.url?.appendQueryItem(name: "api_key", value: Constants.apiKey)
        
        if method == .post {
            let codable: Any = getConcreteCodables()
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: codable, options: .prettyPrinted)
            }
            catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
            return urlRequest
            
        }
        else {
            switch self {
            case .searchMovie(let request):
                urlRequest = try URLEncodedFormParameterEncoder.default.encode(request, into: urlRequest)
            }
            print("GET request url\n: \(String(describing: urlRequest.url?.absoluteString))")
            return urlRequest
        }
    }
    
    private func getConcreteCodables() -> Any {
        switch self {
        default:
            fatalError("Not required")
        }
    }
}
