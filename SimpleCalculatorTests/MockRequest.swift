//
//  MockRequest.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 12/8/24.
//

import Foundation
import XCTest

class MockRequest: URLProtocol{
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data?))?

        override class func canInit(with request: URLRequest) -> Bool {
            return true
        }

        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            return request
        }

        override func startLoading() {
            guard let handler = MockRequest.requestHandler else {
                XCTFail("Handler is unavailable.")
                return
            }

            let (response, data) = handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        }

        override func stopLoading() {}
    }
