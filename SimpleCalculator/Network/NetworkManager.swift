//
//  NetworkManager.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager{
    let apiKey = Constants().api_key
    
    func convertCurrency(completion: @escaping (Double)->Void){
        let url = "https://v6.exchangerate-api.com/v6/b50ae68d06fe0d8206057f0c/pair/EUR/USD"
        
        AF.request(url).responseDecodable(of: ExchangeRateModel.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(value.conversionRate)
                    case .failure(let error):
                        print(error)
                    }
                }
    }
}
