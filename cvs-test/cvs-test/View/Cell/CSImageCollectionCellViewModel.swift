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
        if let spaceIndex = image.author.firstIndex(of: " ") {
            let name = String(image.author.suffix(from: spaceIndex))
            let startIndex = name.index(name.startIndex, offsetBy: 3)
            let endIndex = name.index(name.endIndex, offsetBy: -2)
            return String(name[startIndex..<endIndex])
        }
        return image.author
    }
    
    var tags: String {
        return image.tags
    }
}
