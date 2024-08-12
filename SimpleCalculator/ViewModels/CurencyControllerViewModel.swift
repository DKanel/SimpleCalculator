//
//  CurencyControllerViewModel.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 9/8/24.
//

import Foundation
class CurencyControllerViewModel{
    let networkManager = NetworkManager()
    
    func convertCurrency(fromCurency: String, toCurency: String, completion: @escaping (Double)->Void){
        networkManager.convertCurrency(fromCurency: fromCurency, toCurency: toCurency) { response in
            print(response)
            completion(response)
        }
    }
    
    func evaluteExpression(expression: String)->String?{
        let expressionsSymbols = expression.replacingOccurrences(of: "X", with: "*")
        let regex = "^(?!.*[\\*\\/\\+\\-]{2})(?!.*\\/0)[\\w\\s\\*\\/\\+\\-.]+$"
        let isValid = expressionsSymbols.range(of: regex,options: .regularExpression) != nil
        if isValid{
            let nsExpression = NSExpression(format: expressionsSymbols)
            
            if let result = nsExpression.expressionValue(with: nil, context: nil) as? Double{
                return result.description
            }else{
                print("Something went wrong")
                return nil
            }
        }else{
            print("Not Valid Expression")
            return nil
        }
    }
}
