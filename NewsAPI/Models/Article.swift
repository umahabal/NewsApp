//
//  Article.swift
//  NewsAPI
//
//  Created by URM on 10/06/22.
//

import Foundation


struct Article {
    let relativeDateFormatter = RelativeDateTimeFormatter()

    let id = UUID()

    let source: Source
    let title: String
    let url: String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
    
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
    }
    
    var authorText: String {
        author ?? "\(source.name)"
    }
    
    var descriptionText: String {
        description ?? ""
    }
        
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
}

extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {}

extension Article {
    
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(ArticleAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
    
}


struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}
