//
//  ArticlesListView.swift
//  NewsAPI
//
//  Created by URM on 10/06/22.
//

import SwiftUI

struct ArticlesListView: View {
    
    let articles: [Article]
    @State private var selectedArticle: Article?
    
    @State var navigateToDetails = false // navigation to detail news screen

    var body: some View {
        VStack {
        List {
            ForEach(articles) { article in
                CustomArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                        self.navigateToDetails.toggle()
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
            
            NavigationLink("", destination: NewsDetailView(article: $selectedArticle), isActive: self.$navigateToDetails)

    }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(articles: Article.previewData)
    }
}
