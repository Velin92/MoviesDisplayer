//
//  MoviesSearchBar.swift
//  MoviesDisplayer
//
//  Created by Mauro Romito on 31/05/21.
//

import SwiftUI

struct MoviesSearchBar: View {
    
    @Binding var searchInput: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("", text: $searchInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
        }
        .padding(5)
    }
}

struct MoviesSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearchBar(searchInput: .constant("Test"))
    }
}
