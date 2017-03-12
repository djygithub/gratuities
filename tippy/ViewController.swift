//
//  ViewController.swift
//  tippy
//
//  Created by David on 3/1/17.
//  Copyright © 2017 davidjyoung.com  All rights reserved.
//
//  Function : Compute total bill for a meal including tip, amounts displayed in local currency with thousands separator.
//             One of three tip percentages may be selected:  18%, 20% and 25%.  UI screen color
//             changes (animates) with selected tip percentage.
//
//  Globals  : segid - integer initialized to zero, used to control tip percentage and corresponding background color across views
//
//  IBOutlets: billfiled - UITextField (func calculategratuity) numeric with decimal point for entering meal bill (currency) before tip 1000.00
//             gratuityLabel - UILabel (func calculategratuity) calculated Tip amount in local currency with thousands separator $180.00
//             totalLabel - UILabel (func calculategratuity) calculated total bill amount in local currency with thousands separator $1,180.00
//             TipLabel - UILabel (func calculategratuity) Tip percentage numeric with decimal point .18
//
//  APIs     : NumberFormattter (Foundation)
//             UIViewPropertyAnimator (UIKit)
//             UserDefaults (Foundation)
//
//  Locals   : tipPercentages - 3 element real number array, containing tip percentages represented as .18, .20, and .25
//             tipindex - used to store/retrieve global segid
//             tipcolor - equal to tipindex, used to select animated background color based on tip percentage
//             tip - work variable contains tip amount in currency (bill * tipPercentages(tipindex))
//             total - work varable contains total bill in currency (bill + tip)
//             totnumber - intermediate work variable for total bill formatting
//             tipnumber - intermediate work variable for tip formatting
//             totresult - intermediate work variable for total bill formatting
//             tipresult - intermediate work variable for tip formatting
//             valueToSavevc - work variable for setting segid
//
//  Steps    :
//
//**(1)****    Initialize tip percentage index to 0 (18%) and related backgound color to white upon entry to view
//**(2)****    IBAction ontap Dismiss keyboard.
//**(3)****    IBAction calculategratuity, total bill, send to UI
//     **(3.1)**    Establish tip table percentages
//     **(3.2)**    Retrieve current tip table index
//     **(3.3)**    Animate backgroundColor change according to tip percentage
//     **(3.4)**    Compute tip and total bill
//     **(3.5)**    Format tip and total bill with local currency symbol and thousands separator
//     **(3.6)**    Send tip, total bill, and tip percentage to the UI
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var gratuityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //**(1)** Initialize tip percentage index to 0 (18%) and related backgound color to white
        let valueToSavevc = 0
        UserDefaults.standard.set(valueToSavevc, forKey: "segid")
        UserDefaults.standard.synchronize()
        self.view.backgroundColor = UIColor.white
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ontap(_ sender: AnyObject) {
        //**(2)** Dismiss keyboard.
        view.endEditing(true)
    }

    @IBAction func calculategratuity(_ sender: AnyObject) {
        //**(3)** calculate gratuity
        //**(3.1)** establish tip table percentages
        let tipPercentages = [0.18, 0.2, 0.25]
        
        //**(3.2)** retrieve current tip table index
        let tipindex = UserDefaults.standard.integer(forKey: "segid")
        
        //**(3.3)** Animate backgroundColor change according to tip percentage
        var tipcolor = tipindex
        if tipcolor == 0{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.white
            }
            animator.startAnimation()
        }
        if tipcolor == 1{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.green
            }
            animator.startAnimation()
        }
        if tipcolor == 2{
            let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                self.view.backgroundColor = UIColor.yellow
            }
            animator.startAnimation()
        }
        
        //**(3.4)** compute tip and total bill
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipindex]
        let total = bill + tip
        
        //**(3.5)** format tip and total bill
        let totnumber = NSDecimalNumber(decimal: Decimal(total))
        let tipnumber = NSDecimalNumber(decimal: Decimal(tip))
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        let totresult = numberFormatter.string(from: totnumber)
        let tipresult = numberFormatter.string(from: tipnumber)
        
        //**(3.6)** send tip, total bill, and tip percentage to the UI
        gratuityLabel.text = String(tipresult!)
        totalLabel.text = String(totresult!)
        TipLabel.text = String(format: "%.2f",tipPercentages[tipindex])
        
    }
    
}

