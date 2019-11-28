//
//  ViewController.swift
//  Love Calculator
//
//  Created by Asif Rabbi on 26/11/19.
//  Copyright © 2019 Asif Rabbi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hisNameTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var herNameTextField: UITextField!
    @IBOutlet weak var percentageView: UILabel!
    @IBOutlet weak var lineShower: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    var line1 : String = ("Your love is Perfect and You guys are happy")
    var line2 : String = ("Your love is Average and you guys are fighting")
    var line3 : String = ("Sorry no love")
    var line4 : String = ("Your love is fading out, Sorry")
    var line5 : String = ("You will die single")

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height/2
        hisNameTextField.borderStyle = .bezel
        hisNameTextField.borderStyle = .roundedRect
        herNameTextField.borderStyle = .roundedRect
        tryAgainButton.layer.cornerRadius = tryAgainButton.frame.size.height/2
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        hisNameTextField.isHidden = true
        herNameTextField.isHidden = true
        percentageView.isHidden = false
        lineShower.isHidden = false
        calculateButton.isHidden = true
        //Dissmiss the keyboard by pressing the button
        self.view.endEditing(true)
        
        //Checking if the Text field is empty or not
        if herNameTextField.text?.isEmpty ?? true {
            calculateButton.isHidden = true
        }else{
           lovePercentage()
        }
        if hisNameTextField.text?.isEmpty ?? true {
            calculateButton.isHidden = true
        }else{
            lovePercentage()
        }
    }
    
    @IBAction func tryAgainButton(_ sender: UIButton) {
        percentageView.isHidden = true
        lineShower.isHidden = true
        hisNameTextField.isHidden = false
        herNameTextField.isHidden = false
        calculateButton.isHidden = false
        herNameTextField.text = nil
        hisNameTextField.text = nil
    }
    
    func lovePercentage() {
        //arc4random number shows (paramater-1) random number and is type UInt32
        let loveScore = arc4random_uniform(101)
        //Storing thr UInt32 type as String type
        percentageView.text = String(loveScore)

        if loveScore > 15 && loveScore < 30  {
            lineShower.text = line3
        }else if loveScore > 31 && loveScore < 50 {
            lineShower.text = line4
        }else if loveScore > 51 && loveScore < 79{
            lineShower.text = line2
        }
        else if loveScore > 80 && loveScore < 99 {
            lineShower.text = line1
        }else{
            lineShower.text = line5
        }
    }
    
    
    }

