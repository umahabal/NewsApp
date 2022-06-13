//
//  EnumConstants.swift
//  NewsAPI
//
//  Created by URM on 13/06/22.
//

import Foundation


enum Country: String, CaseIterable {
    case USA
    case CANADA
    
    var text: String {
        if self == .USA {
            return "USA"
        }
        return "Canada"
    }
    
    var countryCode: String {
        if self == .USA {
            return "us"
        }
        return "ca"
    }
}

extension Country: Identifiable {
    var id: Self { self }
}

