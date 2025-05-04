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
        NavigationView {
            List (popularViewModel.shows, id: \.id) { tvShow in
                NavigationLink (
                    destination: DetailTvShowView(
                        viewModel: DetailTvShowViewModel(id: tvShow.id)
                    )
                ) {
                    Text(tvShow.name)
                }
            }
            .onAppear {
                if popularViewModel.shows.isEmpty {
                    Task{
                        popularViewModel.loadPopularShow()
                    }
                }
            }
        }
    }
}

#Preview {
    PopularTvShowView()
}
