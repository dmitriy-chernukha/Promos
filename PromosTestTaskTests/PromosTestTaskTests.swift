//
//  PromosTestTaskTests.swift
//  PromosTestTaskTests
//
//

import XCTest
@testable import PromosTestTask

class PromosTestTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSortByIDViewMode() throws {
        
        let viewModel = UserListViewModel(apiService: MockAPIService())
        viewModel.fetchUsers()
        viewModel.sortUser(sort: .id)
        
        let firstItem = viewModel.users.first
        XCTAssertTrue(firstItem?.id == 0)
    }
    
    func testSortByNameViewMode() throws {
        
        let viewModel = UserListViewModel(apiService: MockAPIService())
        viewModel.fetchUsers()
        viewModel.sortUser(sort: .userName)
        
        let firstItem = viewModel.users.first
        XCTAssertTrue(firstItem?.username == "A")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
