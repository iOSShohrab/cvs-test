//
//  CSImage.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSImage : Decodable {
    
    let title: String
    let link: String
    let media: [String:String]
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case link = "link"
        case media = "media"
        case dateTaken = "date_taken"
        case description = "description"
        case published = "published"
        case author = "author"
        case authorId = "author_id"
        case tags = "tags"
    }
}
