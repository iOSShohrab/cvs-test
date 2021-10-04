//
//  CSImage.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSImage : Decodable {
    
    let title, link, dateTaken, description, published, author, authorId, tags: String
    let media: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case title,link,media,description,published,author,tags
        case dateTaken   = "date_taken"
        case authorId    = "author_id"
    }
}
