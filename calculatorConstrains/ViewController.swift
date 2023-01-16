//
//  ViewController.swift
//  calculatorConstrains
//
//  Created by Jenith on 16/01/23.
//

import UIKit

class ViewController: UIViewController {
    var displayScreen : Double = 0
    var previousNumber : Double = 0
    var performAction = false
    var operation = 0

    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numberPerform(_ sender: UIButton) {
        if performAction == true {

        displayLabel.text = String(sender.tag-1)

        displayScreen = Double(displayLabel.text!)!

        performAction = false

        }

        else {

        displayLabel.text = displayLabel.text! + String(sender.tag-1)

        displayScreen = Double(displayLabel.text!)!

        }
        
    }
    
    @IBAction func calculationButton(_ sender: UIButton) {
        if displayLabel.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(displayLabel.text!)!
            if sender.tag == 12 {
            displayLabel.text = "/";
            }

            if sender.tag == 13 {
            displayLabel.text = "x";
            }
            if sender.tag == 14 {
            displayLabel.text = "-";
            }

            if sender.tag == 15 {
            displayLabel.text = "+";
            }
            operation = sender.tag
            performAction = true;
        }
        else if sender.tag == 16 {
            if operation == 12{
            displayLabel.text = String(previousNumber / displayScreen)
            }
            else if operation == 13{

            displayLabel.text = String(previousNumber * displayScreen)
            }

            else if operation == 14{

            displayLabel.text = String(previousNumber - displayScreen)

            }

            else if operation == 15{

            displayLabel.text = String(previousNumber + displayScreen)
            
        }
            else if sender.tag == 11{

            previousNumber = 0;

            displayScreen = 0;

            operation = 0;

            }

    }
}
    
 
   
    @IBAction func buttonC(_ sender: UIButton) {
        displayLabel.text = ""
        
    }
}
