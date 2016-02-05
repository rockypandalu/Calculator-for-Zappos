//
//  ViewController.swift
//  Calculator
//
//  Created by Yan Lu on 16/2/1.
//  Copyright © 2016年 Yan Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variable define
    var left=0.0
    var curSign=""
    var enterDigit=false
    var flagDot=false
    var flagEqual=false
    @IBOutlet weak var displayLabel: UILabel!
    //Display initiation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayLabel.text=String(0)
    }
    //digit entering
    @IBAction func digitAction(sender: AnyObject) {
        let digit = sender.currentTitle!
        print(flagEqual)
        if digit=="dot"{
            if ["+","-","X","/","%"].contains(displayLabel.text!)||flagEqual{
                displayLabel.text = "."
                flagDot=true
            }
            else{
                if flagDot==false{
                    displayLabel.text = displayLabel.text!+"."
                    flagDot=true
                }
            }
        }
        else{
            if enterDigit{
                displayLabel.text = displayLabel.text!+digit!
            }
            else{
                if flagDot{
                    displayLabel.text=displayLabel.text!+digit!
                }
                else{
                    displayLabel.text = digit
                }
                enterDigit=true
            }

        }
    flagEqual=false
    }
    //"+","-","*","/","%" calculation
    @IBAction func operation(sender: AnyObject) {
        let sign=sender.currentTitle!!
        enterDigit=false
        if ["+","-","X","/","%"].contains(displayLabel.text!){
            displayLabel.text=sign
            curSign=sign
        }
        else if curSign.isEmpty{
            left=Double(displayLabel.text!)!
            curSign=sign
            displayLabel.text=sign
        }
        else{
            operate()
            flagEqual=true
            curSign=sign
            display()
        }
        print(left)
        flagDot=false
    }
    //Square calculation
    @IBAction func square(sender: AnyObject) {
        if !["+","-","X","/","%"].contains(displayLabel.text!){
            left=Double(displayLabel.text!)!*Double(displayLabel.text!)!
            curSign=""
            enterDigit=false
            flagDot=false
            flagEqual=true
            display()
        }
    }
    //Clear app parameters
    @IBAction func Clear(sender: AnyObject) {
        displayLabel.text=String(0)
        left=0.0
        curSign=""
        enterDigit=false
        flagDot=false
        flagEqual=false
    }
    //When press the "equal" sign, print the current result on screen
    @IBAction func showResult(sender: AnyObject) {
        print(curSign)
        if !curSign.isEmpty{
            if ["+","-","X","/","%"].contains(displayLabel.text!){
                curSign=displayLabel.text!
                displayLabel.text=String(left)
                
            }
            operate()
        }
        else{
            left=Double(displayLabel.text!)!
        }
        display()
        left=0.0
        curSign=""
        enterDigit=false
        flagDot=false
        flagEqual=true
    }
    // Used to calcualte "+","-","*","/" and "%"
    func operate(){
        switch curSign{
            case "+":
                left+=Double(displayLabel.text!)!
            case "-":
                left-=Double(displayLabel.text!)!
            case "X":
                left*=Double(displayLabel.text!)!
            case "/":
                left/=Double(displayLabel.text!)!
            case "%":
                left%=Double(displayLabel.text!)!
            default:
                print("error")
        }

    }
    //Because the result is a int, show the result as a int in screen
    func display(){
        if left==Double(Int(left)){
            displayLabel.text=String(Int(left))
        }
        else{
            displayLabel.text=String(left)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

