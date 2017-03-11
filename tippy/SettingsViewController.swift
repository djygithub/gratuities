//
//  SettingsViewController.swift
//  tippy
//
//  Created by David on 3/6/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //@IBOutlet weak var setdeftip: UISegmentedControl!
    @IBOutlet weak var tip18: UIButton!
    @IBOutlet weak var tipper: UIButton!
    @IBOutlet weak var tip20: UIButton!
    
            override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
            let valueToSave = 0
            
            //UserDefaults.standard.integer(forKey: <#T##String#>)
            
            UserDefaults.standard.set(valueToSave, forKey: "segid")
            UserDefaults.standard.synchronize()
            //_ = UserDefaults.standard.integer(forKey: "segid")
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tip20set(_ sender: AnyObject) {
        let segvalueToSave = 1
        //let segvalueToSave = seg[setvalueToSave.selectedSegmentIndex]
        
        
        
        
        
        
        //UserDefaults.standard.integer(forKey: <#T##String#>)
        
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        //self.view.backgroundColor = UIColor.green
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
            self.view.backgroundColor = UIColor.green
            
        }
        
        animator.startAnimation()
        
        
    }
    
    @IBAction func tip18set(_ sender: AnyObject) {
        let segvalueToSave = 0
        
        //let segvalueToSave = seg[setvalueToSave.selectedSegmentIndex]
        
        
        
        
        
        
        //UserDefaults.standard.integer(forKey: <#T##String#>)
        
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        //self.view.backgroundColor = UIColor.white
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
            self.view.backgroundColor = UIColor.white
            
        }
        
        animator.startAnimation()
        
    }


    
    @IBAction func settipper(_ sender: AnyObject) {
        
        let segvalueToSave = 2
        //let segvalueToSave = seg[setvalueToSave.selectedSegmentIndex]
        
        
        
        
        
        
        //UserDefaults.standard.integer(forKey: <#T##String#>)
        
        UserDefaults.standard.set(segvalueToSave, forKey: "segid")
        UserDefaults.standard.synchronize()
        //self.view.backgroundColor = UIColor.yellow
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn){
                     self.view.backgroundColor = UIColor.yellow
            
        }
        
        animator.startAnimation()
        
    }

        
    }

