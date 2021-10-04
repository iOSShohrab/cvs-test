//
//  CSImageCollectionCellViewModel.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSImageCollectionCellViewModel {
    
    let image: CSImage
    
    var title: String {
        return image.title
    }
    
    var published: String {
        return image.published
    }
    
    var dateTaken: String {
        return image.dateTaken
    }
    
    var description: String {
        return image.description
    }
    
    var imageUrl: URL? {
        if let urlString = image.media["m"] {
            return URL.init(string: urlString)
        }
        return nil
    }
    
    var author: String {
        let values = image.author.components(separatedBy: "\"")
        return values.count == 3 ? image.author.components(separatedBy: "\"")[1] : image.author
    }
    
    var tags: String {
        return image.tags
    }
}
