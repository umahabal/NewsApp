//
//  ArticleAPIResponse.swift
//  NewsAPI
//
//  Created by URM on 12/06/22.
//

import Foundation

struct ArticleAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
