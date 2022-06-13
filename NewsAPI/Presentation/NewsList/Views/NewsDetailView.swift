//
//  NewsDetailView.swift
//  NewsAPI
//
//  Created by URM on 13/06/22.
//

import SwiftUI

struct NewsDetailView: View {
    
    @Binding var article: Article?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            AsyncImage(url: article?.imageURL) { phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                @unknown default:
                    fatalError()
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article?.title ?? "")
                    .font(.headline)
                
                Text(article?.descriptionText ?? "")
                    .font(.subheadline)
                
                HStack {
                    Text(article?.authorText ?? "")
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
                    Spacer()
                }
            }
            .padding([.horizontal, .bottom])
         Spacer()
        }
        
    }
}
