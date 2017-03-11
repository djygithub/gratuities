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
        self.view.backgroundColor = UIColor.white
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
        // background color tests
        
        var tipcolor = tipindex
        
        if tipcolor == 0{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.white
                
            }
            
            animator.startAnimation()
            //self.view.backgroundColor = UIColor.white
        }
        if tipcolor == 1{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.green
                
            }
            
            animator.startAnimation()
            //self.view.backgroundColor = UIColor.green
        }
        if tipcolor == 2{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.yellow
                
            }
            
            animator.startAnimation()
            //self.view.backgroundColor = UIColor.yellow
        }
                
        let bill = Double(billField.text!) ?? 0
        //let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * tipPercentages[tipindex]
        let total = bill + tip
        
        //number format experiments
        let totnumber = NSDecimalNumber(decimal: Decimal(total))
        let tipnumber = NSDecimalNumber(decimal: Decimal(tip))
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        let totresult = numberFormatter.string(from: totnumber)
        print(totresult!)
        let tipresult = numberFormatter.string(from: tipnumber)
        print(tipresult!)
        
        
        
        
        
        //gratuityLabel.text = String(format: "$%.2f", tip)
        gratuityLabel.text = String(tipresult!)
        
        //totalLabel.text = String(format: "$%.2f", total)
        totalLabel.text = String(totresult!)
        TipLabel.text = String(format: "%.2f",tipPercentages[tipindex])
        
    }
    
    
    
}

