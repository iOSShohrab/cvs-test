//
//  CSWebService.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

protocol CSWebService {
    func searchImage(_ searchText: String, completion: @escaping ([CSImage]?, CSWebServiceError?) ->())
}
