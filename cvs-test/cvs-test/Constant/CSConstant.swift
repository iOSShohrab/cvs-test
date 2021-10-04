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

struct CSConstant {
    
    static let environment = EnvironementType.dev
    
    struct url {
        static var baseurl: String {
            switch environment {
                case .dev:  return "https://api.flickr.com/services"
                case .prod: return "https://api.flickr.com/services"
            }
        }
        static let searchUrl = baseurl + "/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    }
}
