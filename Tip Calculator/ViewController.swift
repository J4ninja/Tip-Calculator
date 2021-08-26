//
//  ViewController.swift
//  Tip Calculator
//
//  Created by John Nguyen on 8/24/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var manualEntryLabel: UILabel!
    @IBOutlet weak var manualEntryTextField: UITextField!
    @IBOutlet weak var colorControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.becomeFirstResponder()
        manualEntryTextField.keyboardType = .numberPad
 
    }

    @IBAction func calculateTipUponBillChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        if(manualEntryTextField.text!.isEmpty) {
            let tipPercentages = [0.15, 0.18, 0.2]
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }else
        {
            let bill = Double(billAmountTextField.text!) ?? 0
            let manualEntryTip = Double(manualEntryTextField.text!) ?? 0
            let tip = bill * (manualEntryTip/100)
            let total = bill + tip
            
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
       
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        manualEntryTextField.text = nil
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func calculateManualEntry(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let manualEntryTip = Double(manualEntryTextField.text!) ?? 0
        let tip = bill * (manualEntryTip/100)
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func changeColor(_ sender: Any) {
        if(colorControl.selectedSegmentIndex==0) {
            overrideUserInterfaceStyle = .light
        }else
        {
            overrideUserInterfaceStyle = .dark
        }
    }
}

