//
//  DavidLee_VynylTests.swift
//  DavidLee_VynylTests
//
//  Created by David Lee on 2/13/21.
//

import XCTest
@testable import DavidLee_Vynyl

class DavidLee_VynylTests: XCTestCase {

    private var arrayFlattener: ArrayFlattener!
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
        
        override func setUp() {
            super.setUp()
            arrayFlattener = ArrayFlattener()
        }

        func testExample() throws {
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            let data1: [Any] = [["one", "two", ["three"]], "four"]
            let data2: [Any] = ["one", ["two", ["three"], []], [["four"]]]
            let data3: [Any] = []
            
            
            XCTAssertEqual(arrayFlattener.flattenArray(data1), ["one", "two", "three", "four"])
            XCTAssertEqual(arrayFlattener.flattenArray(data2), ["one", "two", "three", "four"])
            XCTAssertEqual(arrayFlattener.flattenArray(data3), [])
            
        }

        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }



}
