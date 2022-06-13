//
//  CustomArticleRowView.swift
//  NewsAPI
//
//  Created by URM on 12/06/22.
//

import SwiftUI

struct CustomArticleRowView: View {
        
    let article: Article
    var body: some View {
        HStack(alignment: .center, spacing: 1) {
            AsyncImage(url: article.imageURL) { phase in
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
                        .aspectRatio(contentMode: .fill)
                    
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
            .frame(maxWidth: 80, maxHeight: 80)
            .background(Color.gray.opacity(0.3))
            .clipped()
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer(minLength: 5)
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
                HStack {
                    Text(article.authorText)
                        .lineLimit(0)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
                    Spacer()
                }
            }
            .padding([.horizontal, .bottom])
            
        }
    }
}

extension View {
    
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
    
}

struct CustomArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                CustomArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}
