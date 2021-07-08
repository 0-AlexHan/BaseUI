//
//  ViewController.swift
//  BaseUI
//
//  Created by Alex Han on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var redColorValue: Float = 0
    var greenColorValue: Float = 0
    var blueColorValue: Float = 0
    
    
    @IBOutlet private weak var redTextField: UITextField!
    @IBOutlet private weak var greenTextField: UITextField!
    @IBOutlet private weak var blueTextField: UITextField!

    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self

            displayColor()
    }
      
    func displayColor() {
        let countCGFloat: Float = 255.0
        let red = CGFloat(redColorValue / countCGFloat)
        let green = CGFloat(greenColorValue / countCGFloat)
        let blue = CGFloat(blueColorValue / countCGFloat)
                let color = UIColor(
                    red: red,
                    green: green,
                    blue: blue,
                    alpha: 1.0
                )
        
        self.view.backgroundColor = color
    }
    
    @IBAction func redSliderDidChangeValue(_ sender: UISlider) {  // переименовать в дид
        let redValue = sender.value
        redTextField.text = String(Int(floor(redValue)))
        redColorValue = redValue
        displayColor()
    }

    @IBAction func greenSliderDidChangeValue(_ sender: UISlider) {
        let greenValue = sender.value
        greenTextField.text = String(Int(floor(greenValue)))
        greenColorValue = greenValue
        displayColor()
    }

    @IBAction func blueSliderDidChangeValue(_ sender: UISlider) {
        let blueValue = sender.value
        blueTextField.text = String(Int(floor(blueValue)))
        blueColorValue = blueValue
        displayColor()
    }
    
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTextField ||
            textField == greenTextField ||
            textField == blueTextField {
            
            textField.resignFirstResponder()
            
            return false
        }
        
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)

        guard let text = textField.text,
              let allowedValue = Int(text + string) else {
            return false
        }

        if allowedValue > UInt8.max {
            return false
        }
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        
        guard let textValue = textField.text,
              let floatValue = Float(textValue) else {
            return
        }

        if textField == redTextField {
            redSlider.setValue(floatValue, animated: true)
            redColorValue = floatValue
        }

        if textField == greenTextField {
            greenSlider.setValue(floatValue, animated: true)
            greenColorValue = floatValue
        }

        if textField == blueTextField {
            blueSlider.setValue(floatValue, animated: true)
            blueColorValue = floatValue
        }

        displayColor()
    }
      
}

