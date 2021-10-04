//
//  CSSearchResultViewModel.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSSearchResultViewModel {
    
    let images: [CSImage]?
    
    var numberOfImages: Int {
        return images?.count ?? 0
    }
    
    var numberOfSections: Int {
        return 1
    }
}

