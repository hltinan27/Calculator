//
//  ViewController.swift
//  Calculator
//
//  Created by inan on 13.04.2018.
//  Copyright © 2018 inan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var userIsInTheMiddleOfTyping = false
  @IBOutlet weak var display: UITextField!
  
  @IBAction func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    }else{
      display.text = digit
      userIsInTheMiddleOfTyping = true
    }
  }
  
  var displayValue: Double  {
    get{
      return Double(display.text!)!
    }
    set{
      display.text = String(newValue)
    }
  }
  private var brain = CalculatorBrain()
  
  @IBAction func performOperation(_ sender: UIButton) {
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }
    
    
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(mathematicalSymbol)
    }
    
    if let result = brain.result {
      displayValue = result
    }
    
  }
  

}

