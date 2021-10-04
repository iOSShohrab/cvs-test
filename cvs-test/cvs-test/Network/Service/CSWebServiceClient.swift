//
//  CSWebServiceClient.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation

struct CSWebServiceClient : CSWebService {
    static let shared = CSWebServiceClient()
    
    func searchImage(_ searchText: String, completion: @escaping ([CSImage]?, CSWebServiceError?) ->()) {
        
        let request = URLRequest(url: URL.init(string: CSConstant.url.searchUrl + searchText)!)
        triggerRequest(using: request) { data, response, error in
            if error != nil {
                completion(nil, .error(message: error!.localizedDescription))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(CSImageSearchResult.self, from: data)
                    completion(decodedResponse.images, nil)
                } catch  let e {
                    print(e)
                    completion(nil, .decode)
                }
            } else {
                completion(nil, .fetch)
            }
        }
    }
    
    private func triggerRequest(using request: URLRequest, handler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            handler(data, response, error)
        }.resume()
    }
}
