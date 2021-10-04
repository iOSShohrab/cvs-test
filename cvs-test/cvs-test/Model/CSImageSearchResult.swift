//
//  CSImageSearchResult.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSImageSearchResult: Decodable {
    var title, description, modified, generator: String
    var images      : [CSImage]?
    
    enum CodingKeys: String, CodingKey {
        case title, description, modified, generator
        case images = "items"
    }
}
