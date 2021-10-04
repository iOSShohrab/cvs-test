//
//  CSSearchResultViewModelTests.swift
//  cvs-testTests
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import XCTest
@testable import cvs_test

/**
 
 TODO:
 Just set up test environment, need to write unit test based on business logic
 */

class CSSearchResultViewModelTests: XCTestCase {
    
    var viewModel: CSSearchResultViewModel!

    override func setUpWithError() throws {
        let filePath = Bundle(for: CSSearchResultViewModelTests.self).path(forResource: "mockdata", ofType: "json")
        
        guard let path = filePath else {
            XCTAssertTrue(true)
            return
        }
        
        let jsonData = FileManager.default.contents(atPath: path)!
        let decoder = JSONDecoder()
        let searchResult = try decoder.decode(CSImageSearchResult.self, from: jsonData)
        viewModel = CSSearchResultViewModel(images: searchResult.images)
    }

    override func tearDownWithError() throws {
    }

    func testNumberOfMovies() throws {
        XCTAssertEqual(viewModel.numberOfImages, 20)
    }
    
    func testNumberOfSection() throws {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }

}
