//
//  NewListView.swift
//  NewsAPI
//
//  Created by URM on 10/06/22.
//

import SwiftUI

struct NewListView: View {
    
    @StateObject var articleNewsVM = ArticleNewsVM()

    
    var body: some View {
        

        NavigationView {

            ArticlesListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)

                .navigationTitle(articleNewsVM.fetchTaskToken.country.text)
                .navigationBarItems(trailing: menu)


        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
//            print("NoView")
            EmptyView()
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshTask)
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadTask() async {
        await articleNewsVM.loadArticles()
    }
    
    @Sendable
    private func refreshTask() {
        DispatchQueue.main.async {
            articleNewsVM.fetchTaskToken = FetchTaskToken(country: articleNewsVM.fetchTaskToken.country, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.country) {
                ForEach(Country.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "gear")
                .imageScale(.large)
        }
    }
}


struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
