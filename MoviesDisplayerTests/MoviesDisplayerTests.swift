//
//  MoviesDisplayerTests.swift
//  MoviesDisplayerTests
//
//  Created by Mauro Romito on 31/05/21.
//

import XCTest
@testable import MoviesDisplayer

class MoviesDisplayerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testError() {
        let mockClient = APIMock()
        mockClient.isErrorTest = true
        let viewModel = MoviesSearchViewModel(searchClient: mockClient)
        viewModel.searchInput = "test"
        let exp = expectation(description: "Test after 2 seconds")
        //Waiting for the debounce
        let result = XCTWaiter.wait(for: [exp], timeout: 1.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.isShowingError == true)
            XCTAssert(viewModel.cellAdapters.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testValidResponse() {
        let mockClient = APIMock()
        mockClient.isErrorTest = false
        let viewModel = MoviesSearchViewModel(searchClient: mockClient)
        viewModel.searchInput = "test"
        let exp = expectation(description: "Test after 2 seconds")
        //Waiting for the debounce
        let result = XCTWaiter.wait(for: [exp], timeout: 1.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.isShowingError == false)
            XCTAssert(!viewModel.cellAdapters.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }

}
