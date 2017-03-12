//
//  SettingsViewController.swift
//  tippy
//
//  Created by David on 3/6/17.
//  Copyright © 2017 davidjyoung.com All rights reserved.
//
//  Function : Set default tip percentage, called from Settings button in ViewController.swift
//             One of three tip percentages may be selected:  18%, 20% and 25%.  UI screen color
//             changes (animates) with selected tip percentage. If the user returns to the Gratuities
//             view without selecting a tip percentage, 18% is selected.
//
//
//  Globals  : segid - integer initialized to zero, used to control tip percentage and corresponding background color across views
//
//  IBOutlets: tip18 - UIButton (func tip18set) selects .18 tip percentage and background color white
//             tipper - UIButton (func settiper) selects .25 tip percentage and backgound color yellow
//             tip20 - UIButton (func tip20set) selects .20 tip percentage and background color green
//
//  APIs     : UIViewPropertyAnimator (UIKit)
//             UserDefaults (Foundation)
//
//  Locals   : valueToSave - work integer for segid
//             segvalueToSave - work integer for segid
//
//  Steps    :
//
//**(1)****    Iniatialize default segid to 0 (tip percentage .18, background color white) upon entry to view
//**(2)****    Set tip percentage index, segid to 0 (.18) and related backgound color to white
//**(3)****    Set tip percentage index, segid to 1 (.20) and related backgound color to green
//**(4)****    Set tip percentage index, segid to 2 (.25) and related backgound color to yellow
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip18: UIButton!
    @IBOutlet weak var tipper: UIButton!
    @IBOutlet weak var tip20: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //**(1)**** Set default segid to 0 (tip percentage .18, background color white)
            let valueToSave = 0
            UserDefaults.standard.set(valueToSave, forKey: "segid")
            UserDefaults.standard.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //**(3)****    Set tip percentage index, segid to 0 (.20) and related backgound color to green
    @IBAction func tip20set(_ sender: AnyObject) {
        let segvalueToSave = 1
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
            self.view.backgroundColor = UIColor.green
        }
        animator.startAnimation()
    }
    
    //**(2)****    Set tip percentage index, segid to 0 (.18) and related backgound color to white
    @IBAction func tip18set(_ sender: AnyObject) {
        let segvalueToSave = 0
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
            self.view.backgroundColor = UIColor.white
        }
        animator.startAnimation()
    }

    //**(4)****    Set tip percentage index, segid to 0 (.25) and related backgound color to yellow
    @IBAction func settipper(_ sender: AnyObject) {
        let segvalueToSave = 2
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                     self.view.backgroundColor = UIColor.yellow
        }
        animator.startAnimation()
    }
    }

