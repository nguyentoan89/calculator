//
//  ViewController.swift
//  Caculator
//
//  Created by Nguyen Cong Toan on 3/28/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTappingNumber: Bool  = false
    var endOperator: Bool = true
    var fistNumber: Double = 0
    var endNumber: Double = 0
    var Operation:  String = ""
    
    
    @IBOutlet weak var distanceBetweenTextfielAndResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextFiel: UITextField!

    @IBOutlet weak var distanceBetweenResultAndMidleView: NSLayoutConstraint!
    
    @IBOutlet weak var lbl_Result: UILabel!
    
    func updateContraint() -> Void
    {
        //667 la chieu cao cua man hinh iphone 6
        // neu muon dung cho tat ca cac thiet bi 
        let scale = UIScreen.main.bounds.height / 667
        distanceBetweenResultAndMidleView.constant = UIScreen.main.bounds.height > 480 ? distanceBetweenResultAndMidleView.constant * scale : distanceBetweenResultAndMidleView.constant * 0.1
        distanceBetweenTextfielAndResultLabel.constant = UIScreen.main.bounds.height > 480 ? distanceBetweenTextfielAndResultLabel.constant * scale : distanceBetweenTextfielAndResultLabel.constant * 0.1
        
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateContraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextFiel.isUserInteractionEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        let number = sender.currentTitle
        if isTappingNumber == true
        {
            inputTextFiel.text = inputTextFiel.text! + number!
        }
        else
        {
            inputTextFiel.text = number
            isTappingNumber = true
        }
    }
    

    @IBAction func operationAction(_ sender: UIButton) {
        Operation = sender.currentTitle!
        if let inputOperaion = Double(inputTextFiel.text!)
        {
            if endOperator == true
            {
                fistNumber = inputOperaion
                endOperator = false
            }
            else
            {
                fistNumber = Double(lbl_Result.text!)!
                inputTextFiel.text = "\(fistNumber)"
            }
            
        }else
        {
            print("Please input number")
        }
        
        isTappingNumber = false
        if Operation == "%"
        {
            equalAction(sender)
        }
        else if Operation == "+/-"
        {
            equalAction(sender)
        }
    }
    @IBAction func equalAction(_ sender: UIButton) {
        
        isTappingNumber = false
        var result:Double  = 0
        if let realNumber  = Double(inputTextFiel.text!)
        {
            endNumber = realNumber
        }
        switch Operation {
        case "+":
            result = fistNumber + endNumber
        case "-":
            result = fistNumber - endNumber
        case "x":
            result = fistNumber * endNumber
        case "/":
            result = fistNumber / endNumber
        case "+/-":
            if fistNumber < 0
            {
                fistNumber = fabs(fistNumber)
                result = fistNumber
            } else
            {
                fistNumber = -1 * fistNumber
                result = fistNumber
            }
            inputTextFiel.text = "\(result)"
        case "%":
            result = fistNumber / 100
        default:
            print("Error")
        }
        lbl_Result.text = "\(result)"
    }

    @IBAction func ACAction(_ sender: UIButton) {
        fistNumber = 0
        endNumber = 0
        inputTextFiel.text = ""
        lbl_Result.text = "0"
        endOperator = true
    }
 }

