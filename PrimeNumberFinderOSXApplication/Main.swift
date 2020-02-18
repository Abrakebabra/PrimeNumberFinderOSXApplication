//
//  Main.swift
//  PrimeNumberFinderOSXApplication
//
//  Created by Keith Lee on 2020/02/17.
//  Copyright © 2020 Keith Lee. All rights reserved.
//


import Foundation


func noInputCheck(input : String) -> String {
    // If nothing has been input, give pre-selected integer
    if input.isEmpty {
        let selection : Int = Int.random(in: 1...2)
        
        if selection == 1 {
            return "9,709,387,509,743"
        } else if selection == 2 {
            return "232,323,808,049"
        }
    }
    return input
}


func removeCommas(input : String) -> String {
    let inputString : String = input
    let outputString : String = inputString.replacingOccurrences(of: ",", with: "")
    return outputString
}


func stringToInteger(input : String) -> Int {
    // Converts string to integer
    // If not convertable, returns 0
    let integer : Int = Int(input) ?? 0
    return integer
}


func integerCheck(input : Int) -> Int {
    // Converts negative integers to positive
    // Returns 0 if 0 or 1 is input
    // Return of 0 will be marked as not a valid integer
    var absInt : Int = abs(input)
    
    if absInt == 1 {
        absInt = 0
    }
    
    return absInt
}


func commaSeparate(input: Int) -> String {
    // Takes an integer, formats it to a string with commas every 3 digits
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formatted : String? = numberFormatter.string(from: NSNumber(value:input))
    
    if let formattedString : String = formatted {
        return formattedString
    } else {
        return ""
    }
}


func primeNumFinder(integer : Int) -> String{
    
    var prime : Bool = true
    var i : Int = 3 // starting loop
    var divisibleBy : Int = 1
    let integerSqrt = Int(sqrt(Double(integer)))
    var outputString : String
    
    if integer != 2 && integer % 2 == 0 {
        prime = false
        divisibleBy = 2
        
    } else {
        while prime == true && i <= integerSqrt {
            if integer % i == 0 {
                prime = false
                divisibleBy = i
            }
            i += 2
        }
    }
    

    let divisibleString : String = commaSeparate(input: divisibleBy)
    let tested : String = commaSeparate(input: (i - 1) / 2)
    let again = "Hit me baby one more prime!"
    
    if prime == true {
        outputString = "Prime number!\n\n\nTested \(tested) times\n\(again)"
    } else {
        outputString = "Divisible by \(divisibleString)\n\n\nTested \(tested) times\n\(again)"
    }
    
    return outputString
}
