//
//  ViewController.swift
//  BitManipulationForNumbers
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-27.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit

class BitManipulationViewController: UIViewController {
    
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var binaryXText: UITextField!
    @IBOutlet weak var binaryYText: UITextField!
    @IBOutlet weak var binaryResultText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.xTextField.delegate = self
        self.yTextField.delegate = self
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        // hide keyboard
        self.xTextField.resignFirstResponder()
        self.yTextField.resignFirstResponder()
        
        // validate input and make sure it's numeric
        guard
            self.xTextField.text!.count > 0, self.yTextField.text!.count > 0
            else {return }
        
        let x = Int(self.xTextField.text!) ?? 0
        let y = Int(self.yTextField.text!) ?? 0
        
        // XOR will give ones for differences which is what we need
        let diff = x ^ y
        
        // display different in binary
        let diffBinaryString = String(diff, radix: 2)
        
        // generate array of zeros and ones from binary result
        let intArray = diffBinaryString.map{ Int(String($0)) ?? 0 }
        
        // sum the ones in the result
        let result = intArray.reduce(0 , +)
        
        // display result
        self.resultLabel.text = "\(result)"
        self.binaryXText.text = String(x, radix: 2)
        self.binaryYText.text = String(y, radix: 2)
        self.binaryResultText.text = diffBinaryString
    }
}

extension BitManipulationViewController : UITextFieldDelegate {
    
    // make sure only dicimal input is allowed
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if String(string.unicodeScalars.filter{CharacterSet.letters.contains($0) || $0 == " "}).count > 0 {
            return false
        }
        return true
    }
}

