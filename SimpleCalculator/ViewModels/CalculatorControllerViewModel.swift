//
//  CalculatorControllerViewModel.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import Foundation

class CalculatorControllerViewModel{
    let networkManager = NetworkManager()
    
    func convertCurrency(currency: String){
        networkManager.convertCurrency(currency: currency) { response in
            print(response)
        }
    }
}
