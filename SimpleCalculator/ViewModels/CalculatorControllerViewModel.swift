//
//  CalculatorControllerViewModel.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import Foundation

class CalculatorControllerViewModel{
    
    func evaluteExpression(expression: String)->String?{
        let expressionsSymbols = expression.replacingOccurrences(of: "X", with: "*")
        let regex = "^(?!.*[\\*\\/\\+\\-]{2})(?!.*\\/0)[\\w\\s\\*\\/\\+\\-.]+$"
        let isValid = expressionsSymbols.range(of: regex,options: .regularExpression) != nil
        if isValid{
            let nsExpression = NSExpression(format: expressionsSymbols)
            
            if let result = nsExpression.expressionValue(with: nil, context: nil) as? NSNumber{
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
