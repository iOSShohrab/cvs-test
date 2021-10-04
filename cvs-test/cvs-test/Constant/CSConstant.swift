//
//  CSConstant.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

enum EnvironementType {
    case dev, prod
}

private struct urls {
    static let dev  = "https://api.flickr.com/services"
    static let prod = "https://api.flickr.com/services"
}

struct CellKey {
    static let resultCollectionCell = "ImageCollectionViewCell"
}

struct SegueKey {
    static let imageDetails = "segue-imageDetails"
}

struct CSConstant {
    
    /// This should be only place to change environment. We have different way to handle this. 
    static let environment = EnvironementType.dev
    
    struct url {
        static var baseurl: String {
            switch environment {
                case .dev:  return urls.dev
                case .prod: return urls.prod
            }
        }
        static let searchUrl = baseurl + "/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    }
}
