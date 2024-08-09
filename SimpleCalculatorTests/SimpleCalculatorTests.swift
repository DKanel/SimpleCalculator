//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import XCTest
@testable import SimpleCalculator

final class SimpleCalculatorTests: XCTestCase {
    var viewModel: CalculatorControllerViewModel!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        viewModel = CalculatorControllerViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        
        try super.tearDownWithError()
    }

    func testValidExpressions() {
            XCTAssertEqual(viewModel.evaluteExpression(expression: "3 + 5"), "8.0")
            XCTAssertEqual(viewModel.evaluteExpression(expression: "10 - 2 * 3"), "4.0")
            XCTAssertEqual(viewModel.evaluteExpression(expression: "4 / 2 + 7"), "9.0")
            XCTAssertEqual(viewModel.evaluteExpression(expression: "5 X 3"), "15.0")
        }
    
    func testConvertCurrencySuccess() {
        //TO DO : create a mock network manager for a standard value of conversion rate
            let expectation = self.expectation(description: "Conversion should succeed")

            viewModel.convertCurrency { response in
                XCTAssertEqual(response, 1.0918, "The conversion rate should be 1.0918")
                    expectation.fulfill()
        }
            
            waitForExpectations(timeout: 1, handler: nil)
        }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
