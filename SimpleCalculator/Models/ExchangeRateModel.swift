//
//  File.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import Foundation

struct ExchangeRateModel: Decodable {
    let conversionRate: Double

    enum CodingKeys: String, CodingKey {
        case conversionRate = "conversion_rate"
    }
}


