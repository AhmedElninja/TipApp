//
//  ViewController.swift
//  Tip
//
//  Created by Ahmed Alaa on 15/07/2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //Mark: - Outlets.
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    //Mark: -Actions.
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        selectingTip()
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithOutLastCh = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleWithOutLastCh)!
        tip = buttonTitleAsNumber / 100
        
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatorBtnTapped(_ sender: UIButton) {
        let  bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
             finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //Mark: - Private Methods.
    private func selectingTip() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
}


