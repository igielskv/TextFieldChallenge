//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldChallenge
//
//  Created by Manoli on 03/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let presentText = textField.text! as NSString
        let newText = presentText.replacingCharacters(in: range, with: string)
        
        return newText.count <= 5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
