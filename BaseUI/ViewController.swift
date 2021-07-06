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
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBAction func UIredSlider(_ sender: UISlider) {
        let redValue = sender.value
        redLabel.text = "\(redValue)"
        redColorValue = redValue
        displayColor()
    }
  
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBAction func UIgreenSlider(_ sender: UISlider) {
        let greenValue = sender.value
        greenLabel.text = "\(greenValue)"
        greenColorValue = greenValue
        displayColor()
    }
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBAction func UIblueSlider(_ sender: UISlider) {
        let blueValue = sender.value
        blueLabel.text = "\(blueValue)"
        blueColorValue = blueValue
        displayColor()
    }
    
   
    func displayColor(){
        let red = CGFloat(redColorValue)
        let green = CGFloat(greenColorValue)
        let blue = CGFloat(blueColorValue)
        let color = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
        
        self.view.backgroundColor = color
    }
    
    
    
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redLabel.text = "0"
        greenLabel.text = "0"
        blueLabel.text = "0"
        
    }


}

