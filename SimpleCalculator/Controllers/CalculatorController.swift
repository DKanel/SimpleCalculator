//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Dimitris Kanellidis on 8/8/24.
//

import UIKit

class CalculatorController: UIViewController, PassConvertedCurency {
    
    //Outlets
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    //Variables
    let viewModel = CalculatorControllerViewModel()
    var textInput: String = ""
    var convertedCurency: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CurencySegue" {
            if let destinationVC = segue.destination as? CurencyViewController{
                destinationVC.delegate = self
                destinationVC.modalPresentationStyle = .overCurrentContext
                destinationVC.numberToConver = bottomLabel.text ?? ""
            }
            
        }
    }
    
    func didPassCurence(curency: String) {
        convertedCurency = curency
        bottomLabel.text = convertedCurency
    }
    

//MARK: Actions
    
    @IBAction func commaButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")."
    }
    
    @IBAction func currencyButtonAction(_ sender: Any) {
        topLabel.text = bottomLabel.text
        let curencyToConvert = self.topLabel.text ?? ""
        guard let resultOfCurencyToConvert = self.viewModel.evaluteExpression(expression: curencyToConvert) else{
            print("empty result of curency to convert")
            self.topLabel.text = ""
            self.bottomLabel.text = ""
            self.showAlert()
            return
        }
        bottomLabel.text = resultOfCurencyToConvert
        performSegue(withIdentifier: "CurencySegue", sender: nil)
       
    }
    
    @IBAction func equalButtonAction(_ sender: Any) {
        topLabel.text = bottomLabel.text
        guard let evaluatedExpression = viewModel.evaluteExpression(expression: bottomLabel.text ?? "") else{
            self.showAlert()
            topLabel.text = ""
            bottomLabel.text = ""
            return
        }
        bottomLabel.text = evaluatedExpression
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")+"
    }
    
    @IBAction func minus(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")-"
    }
    
    @IBAction func multiplyButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")X"
    }
    
    @IBAction func divideButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")/"
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        if bottomLabel.text != ""{
            bottomLabel.text?.removeLast()
            print("the input is: \(String(describing: bottomLabel.text))")
        }else{
            print("is empty")
        }
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        topLabel.text = ""
        bottomLabel.text = ""
    }
    
    @IBAction func zeroButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")0"
    }
    
    @IBAction func oneButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")1"
    }
    
    @IBAction func twoButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")2"
    }
    
    @IBAction func threeButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")3"
    }
    
    @IBAction func fourButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")4"
    }
    
    @IBAction func fiveButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")5"
    }
    
    @IBAction func sixButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")6"
    }
    
    @IBAction func sevenButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")7"
    }
    
    @IBAction func eightButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")8"
    }
    
    @IBAction func nineButtonAction(_ sender: Any) {
        bottomLabel.text = "\(bottomLabel.text ?? "")9"
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "ERROR",
                                                   message: "There was an error with the input, try a different one!",
                                                   preferredStyle: .alert)
           
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK button tapped")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

