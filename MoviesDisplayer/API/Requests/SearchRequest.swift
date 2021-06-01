//
//  SearchRequest.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 01/06/21.
//

import Foundation

struct SearchRequest: Encodable {
    let query: String
    let page: Int
}
