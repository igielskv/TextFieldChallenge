//
//  ViewController.swift
//  TextFieldChallenge
//
//  Created by Manoli on 03/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var cashTextFiled: UITextField!
    @IBOutlet var switchedTextField: UITextField!
    @IBOutlet var editingSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        zipCodeTextField.delegate = zipCodeDelegate
        cashTextFiled.delegate = cashDelegate
        switchedTextField.delegate = self
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return editingSwitch.isOn
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @IBAction func toggleEdittingSwitch(_ sender: UISwitch) {
        if !editingSwitch.isOn {
            switchedTextField.resignFirstResponder()
        }
    }
    
}

