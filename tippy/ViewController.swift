//
//  ViewController.swift
//  tippy
//
//  Created by David on 3/1/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var gratuityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let valueToSavevc = 0
        
        //UserDefaults.standard.integer(forKey: <#T##String#>)
        
        UserDefaults.standard.set(valueToSavevc, forKey: "segid")
        UserDefaults.standard.synchronize()
        //_ = UserDefaults.standard.integer(forKey: "segid")
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ontap(_ sender: AnyObject) {
        // Dismiss keyboard.
        view.endEditing(true)
        
    }

    @IBAction func calculategratuity(_ sender: AnyObject) {
        //calculate gratuity
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        
        let tipindex = UserDefaults.standard.integer(forKey: "segid")
        
                
        let bill = Double(billField.text!) ?? 0
        //let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * tipPercentages[tipindex]
        let total = bill + tip
        
        gratuityLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        TipLabel.text = String(format: "%.2f",tipPercentages[tipindex])
        
    }
    
    
    
}

