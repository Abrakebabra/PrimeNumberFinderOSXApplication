//
//  ViewController.swift
//  PrimeNumberFinderOSXApplication
//
//  Created by Keith Lee on 2020/02/17.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var inputText: NSTextField!
    @IBOutlet weak var outputText: NSTextField!
    
    
    
    @IBAction func findPrimeButton(_ sender: Any) {
        
        // If nothing in field, put in a number
        inputText.stringValue = noInputCheck(input: inputText.stringValue)
        // Raw String
        let inputString = inputText.stringValue
        // Removes commas from input
        let noCommaString : String = removeCommas(input: inputString)
        // Is it a valid integer?  If not, return "0"
        let inputInteger : Int = stringToInteger(input: noCommaString)
        // If integer is 1, return "0"
        let validInteger : Int = integerCheck(input: inputInteger)
        // If received integer is 0, not a valid input.
        
        if validInteger == 0 {
            outputText.stringValue = "Not a valid integer."
            return
        }
        
        // add comma separators to digits in input field to beautify it
        inputText.stringValue = commaSeparate(input: validInteger)
        // do the magic
        outputText.stringValue = primeNumFinder(integer: validInteger)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

