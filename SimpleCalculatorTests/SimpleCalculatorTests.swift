//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import XCTest
import Alamofire
@testable import SimpleCalculator

final class SimpleCalculatorTests: XCTestCase {
    var viewModel: CurencyControllerViewModel!
    var networkManager: NetworkManager!
    var session: Session!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        viewModel = CurencyControllerViewModel()
        networkManager = NetworkManager()
        
        //Mock Request
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockRequest.self]
        session = Session(configuration: config)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        session = nil
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
        let expectedConversionRate = 1.23
        let mockData = """
        {
            "conversion_rate": \(expectedConversionRate)
        }
        """.data(using: .utf8)
       
        MockRequest.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, mockData)
        }
        
        let expectation = self.expectation(description: "Currency conversion completes")

        networkManager.convertCurrency(fromCurency: "EUR", toCurency: "USD", session: session, completion: { conversionRate in
                XCTAssertEqual(conversionRate, expectedConversionRate)
                expectation.fulfill()
            })

                waitForExpectations(timeout: 5, handler: nil)
        }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
