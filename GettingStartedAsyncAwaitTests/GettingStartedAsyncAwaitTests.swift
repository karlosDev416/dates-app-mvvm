//
//  GettingStartedAsyncAwaitTests.swift
//  GettingStartedAsyncAwaitTests
//
//  Created by Karlos Aguirre Zaragoza on 13/03/23.
//

import XCTest
@testable import GettingStartedAsyncAwait

final class GettingStartedAsyncAwaitTests: XCTestCase {

    private var sut:CurrentDateListViewModel!
    private var webService: MockWebService!
    
    @MainActor override func setUp() {
        super.setUp()
        webService = MockWebService()
        sut = .init(webService: webService)
    }
    
    override func tearDown() {
        super.tearDown()
        webService = nil
        sut = nil
    }
    
    func test_set_dates_when_get_dates_is_called() async {
        do {
            let expectation = XCTestExpectation(description: "set dates called")
            if let currentDate = try await webService.getDate() {
                expectation.fulfill()
                XCTAssertEqual(currentDate.date, "Mon Mar 13 2023")
            }
        } catch {
            XCTFail("expecting dates model")
        }
    }
}

class MockWebService: WebService {
    
    func getDate() async throws -> GettingStartedAsyncAwait.CurrentDate? {
        return CurrentDate.init(date: "Mon Mar 13 2023")
    }
    
}
