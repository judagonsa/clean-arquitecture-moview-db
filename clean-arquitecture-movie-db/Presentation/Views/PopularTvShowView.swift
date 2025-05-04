//
//  PopularTvShowView.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

import SwiftUI

struct PopularTvShowView: View {
    @StateObject private var popularViewModel = PopularShowViewModel()
    
    var body: some View {
        List (popularViewModel.shows, id: \.id) { tvShow in
            Text(tvShow.name)
        }
        .onAppear {
            Task{
                popularViewModel.loadPopularShow()
            }
        }
    }
}

#Preview {
    PopularTvShowView()
}
