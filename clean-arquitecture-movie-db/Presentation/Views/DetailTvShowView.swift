//
//  DetailTvShowView.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

import SwiftUI

struct DetailTvShowView: View {
    
    @StateObject private var viewModel: DetailTvShowViewModel
    
    init(viewModel: DetailTvShowViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let details = viewModel.details {
                Text(details.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                
                Text(details.overview)
                
                if !details.genres.isEmpty {
                    Text("Generos")
                        .font(.subheadline)
                    
                    ForEach(details.genres) { genres in
                        Text(genres.name)
                    }
                }
            } else {
                Text("Cargando...")
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadDetail(id: viewModel.showId)
            }
            
        }
    }
}

#Preview {
//    DetailTvShowView()
}
