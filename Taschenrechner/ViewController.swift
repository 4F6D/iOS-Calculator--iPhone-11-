//
//  ViewController.swift
//  Taschenrechner
//
//  Created by Rene on 10.05.23.
//

import UIKit

class ViewController: UIViewController {

    // Ergebnis Anzeige
    @IBOutlet weak var resultLabel: UILabel!
    
    var userIsInTheMiddleOfTyping : Bool = false
    
    var decimalusing : Bool = false
    
    var firstNumber : Double = 0.0
    var secondNumber : Double = 0.0
    var result : Double = 0.0
    var choosingOperator : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func numberButton_Tapped(_ sender: RoundButton) {
        var key = sender.titleLabel!.text!
        
        if (userIsInTheMiddleOfTyping == true) {
            if (decimalusing == true && key == ".") {
                key = ""
            }
            
            resultLabel.text = resultLabel.text! + key
        } else {
            resultLabel.text = key
            userIsInTheMiddleOfTyping = true
        }
        
        if (key == ".") {
            decimalusing = true
        }
    }
    
    @IBAction func equalButton_Tapped(_ sender: RoundButton) {
        secondNumber = Double(resultLabel.text!)!
        
        calculate(_operator: choosingOperator)
        
        resultLabel.text = String(result)
        
        userIsInTheMiddleOfTyping = false
        decimalusing = false
    }
    
    // AC Button Action
    @IBAction func clearButton_Tapped(_ sender: RoundButton) {
        result = 0.0
        firstNumber = 0.0
        secondNumber = 0.0
        choosingOperator = ""
        
        resultLabel.text = "0"
        decimalusing = false
    }
    
    
    @IBAction func operationsButton_Tapped(_ sender: RoundButton) {
        if (resultLabel.text != ".") {
            firstNumber = Double(resultLabel.text!)!
            
            userIsInTheMiddleOfTyping = false
            choosingOperator = sender.titleLabel!.text!
            
            decimalusing = false
        }
    }
    
    func calculate(_operator : String) {
        switch (_operator) {
        case "+": result = firstNumber + secondNumber
        case "-": result = firstNumber - secondNumber
        case "x": result = firstNumber * secondNumber
        case "÷": result = firstNumber / secondNumber
        default: break
        }
    }
    
}

