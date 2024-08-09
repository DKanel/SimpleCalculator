//
//  CurencyView.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 9/8/24.
//

import Foundation
import UIKit
class CurencyViewController: UIViewController{
    var numberToConver = ""
    weak var delegate: PassConvertedCurency?
    let viewModel = CurencyControllerViewModel()
    let dataSource = ["EUR",
                      "AED",
                      "AFN",
                      "ALL",
                      "AMD",
                      "ANG",
                      "AOA",
                      "ARS",
                      "AUD",
                      "AWG",
                      "AZN",
                      "BAM",
                      "BBD",
                      "BDT",
                      "BGN",
                      "BHD",
                      "BIF",
                      "BMD",
                      "BND",
                      "BOB",
                      "BRL",
                      "BSD",
                      "BTN",
                      "BWP",
                      "BYN",
                      "BZD",
                      "CAD",
                      "CDF",
                      "CHF",
                      "CLP",
                      "CNY",
                      "COP",
                      "CRC",
                      "CUP",
                      "CVE",
                      "CZK",
                      "DJF",
                      "DKK",
                      "DOP",
                      "DZD",
                      "EGP",
                      "ERN",
                      "ETB",
                      "FJD",
                      "FKP",
                      "FOK",
                      "GBP",
                      "GEL",
                      "GGP",
                      "GHS",
                      "GIP",
                      "GMD",
                      "GNF",
                      "GTQ",
                      "GYD",
                      "HKD",
                      "HNL",
                      "HRK",
                      "HTG",
                      "HUF",
                      "IDR",
                      "ILS",
                      "IMP",
                      "INR",
                      "IQD",
                      "IRR",
                      "ISK",
                      "JEP",
                      "JMD",
                      "JOD",
                      "JPY",
                      "KES",
                      "KGS",
                      "KHR",
                      "KID",
                      "KMF",
                      "KRW",
                      "KWD",
                      "KYD",
                      "KZT",
                      "LAK",
                      "LBP",
                      "LKR",
                      "LRD",
                      "LSL",
                      "LYD",
                      "MAD",
                      "MDL",
                      "MGA",
                      "MKD",
                      "MMK",
                      "MNT",
                      "MOP",
                      "MRU",
                      "MUR",
                      "MVR",
                      "MWK",
                      "MXN",
                      "MYR",
                      "MZN",
                      "NAD",
                      "NGN",
                      "NIO",
                      "NOK",
                      "NPR",
                      "NZD",
                      "OMR",
                      "PAB",
                      "PEN",
                      "PGK",
                      "PHP",
                      "PKR",
                      "PLN",
                      "PYG",
                      "QAR",
                      "RON",
                      "RSD",
                      "RUB",
                      "RWF",
                      "SAR",
                      "SBD",
                      "SCR",
                      "SDG",
                      "SEK",
                      "SGD",
                      "SHP",
                      "SLE",
                      "SLL",
                      "SOS",
                      "SRD",
                      "SSP",
                      "STN",
                      "SYP",
                      "SZL",
                      "THB",
                      "TJS",
                      "TMT",
                      "TND",
                      "TOP",
                      "TRY",
                      "TTD",
                      "TVD",
                      "TWD",
                      "TZS",
                      "UAH",
                      "UGX",
                      "USD",
                      "UYU",
                      "UZS",
                      "VES",
                      "VND",
                      "VUV",
                      "WST",
                      "XAF",
                      "XCD",
                      "XDR",
                      "XOF",
                      "XPF",
                      "YER",
                      "ZAR",
                      "ZMW",
                      "ZWL"]
    
    @IBOutlet weak var initialCurencyButton: UIButton!
    @IBOutlet weak var endCurencyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let actionClosure = { (action: UIAction) in
            print(action.title)
        }
        var menuChildren: [UIMenuElement] = []
        for curency in dataSource {
            menuChildren.append(UIAction(title: curency, handler: actionClosure))
        }
        
        initialCurencyButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        
        initialCurencyButton.showsMenuAsPrimaryAction = true
        initialCurencyButton.changesSelectionAsPrimaryAction = true
        
        endCurencyButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        
        endCurencyButton.showsMenuAsPrimaryAction = true
        endCurencyButton.changesSelectionAsPrimaryAction = true
    }
    
    //MARK: Actions
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func convertButtonAction(_ sender: Any) {
        viewModel.convertCurrency(fromCurency: initialCurencyButton.titleLabel?.text ?? "EUR", toCurency: endCurencyButton.titleLabel?.text ?? "EUR"){ response in
            guard let resultOfCurencyToConvert = self.viewModel.evaluteExpression(expression: self.numberToConver) else{
                print("empty result of curency to convert")
                return
            }
            let curencyConverted = (Double(resultOfCurencyToConvert) ?? 0) * response
            print("The curency is: \(curencyConverted)")
            self.delegate?.didPassCurence(curency: String(curencyConverted))
            self.dismiss(animated: true)
        }
    }
}
