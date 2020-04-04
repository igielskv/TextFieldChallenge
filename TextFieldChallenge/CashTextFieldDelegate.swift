//
//  CashTextFieldDelegate.swift
//  TextFieldChallenge
//
//  Created by Manoli on 04/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let presentText = textField.text! as NSString
        var newText = presentText.replacingCharacters(in: range, with: string)
        
        // Extract only digits from new string
        let digits = CharacterSet.decimalDigits
        var digitsText = ""
        for ch in newText.unicodeScalars {
            if digits.contains(ch) {
                digitsText.append(Character(ch))
            }
        }
        
        // Format new text string as USD from digits
        if let digitsNumber = Double(digitsText) {
            let numberFomatter = NumberFormatter()
            numberFomatter.numberStyle = .currency
            newText = numberFomatter.string(from: NSNumber(value: digitsNumber / 100))!
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
