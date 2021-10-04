//
//  CSImageSearchResult.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSImageSearchResult : Decodable {
    var title: String
    var description: String
    var modified : String
    var generator : String
    var images : [CSImage]?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case modified = "modified"
        case generator = "generator"
        case images = "items"
    }
}
