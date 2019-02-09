//
//  ViewController.swift
//  Assignment2
//
//  Created by Sydney Blackburn(816557736) on 9/15/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // restore values of text fields and sliders
        redSlider.setValue(UserDefaults.standard.float(forKey: "redSlider"), animated: true)
        greenSlider.setValue(UserDefaults.standard.float(forKey: "greenSlider"), animated: true)
        blueSlider.setValue(UserDefaults.standard.float(forKey: "blueSlider"), animated: true)
        textFieldRed.text = "\(UserDefaults.standard.integer(forKey: "textFieldRed"))"
        textFieldGreen.text = "\(UserDefaults.standard.integer(forKey: "textFieldGreen"))"
        textFieldBlue.text = "\(UserDefaults.standard.integer(forKey: "textFieldBlue"))"
        
        // restore color of rectangle
        self.changeColor(nil)
    }
    
    
    /*
     All necessary outlets
     */
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var colorView: UIView!
    
    
    /*
     Hide keyboard when user taps anywhere
     */
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textFieldRed.resignFirstResponder()
        textFieldGreen.resignFirstResponder()
        textFieldBlue.resignFirstResponder()
    }
    
    
    /*
     Change color of box using RGB color codes
     Hides keyboard when button is pressed
     */
    @IBAction func changeColor(_ sender: UIButton?) {
        textFieldRed.resignFirstResponder()
        textFieldGreen.resignFirstResponder()
        textFieldBlue.resignFirstResponder()
        
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        
        if redSlider.value != 0  {
            red = CGFloat(redSlider.value / 100)
        } else {
            red = CGFloat(0)
        }
        
        if greenSlider.value != 0  {
            green = CGFloat(greenSlider.value / 100)
        } else {
            green = CGFloat(0)
        }
        
        if blueSlider.value != 0  {
            blue = CGFloat(blueSlider.value / 100)
        } else {
            blue = CGFloat(0)
        }
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    /*
     Change text of text fields when changing value of sliders
     stores values of text fields and sliders using UserDefaults
    */
    @IBAction func redSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        UserDefaults.standard.set(currentValue, forKey: "textFieldRed")
        UserDefaults.standard.set(sender.value, forKey: "redSlider")
        textFieldRed.text = "\(currentValue)"
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        UserDefaults.standard.set(currentValue, forKey: "textFieldGreen")
        UserDefaults.standard.set(sender.value, forKey: "greenSlider")
        textFieldGreen.text = "\(currentValue)"
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        UserDefaults.standard.set(currentValue, forKey: "textFieldBlue")
        UserDefaults.standard.set(sender.value, forKey: "blueSlider")
        textFieldBlue.text = "\(currentValue)"
    }
    
    
    /*
     Change value of sliders when changing text fields
     stores values of text fields and sliders using UserDefaults
     */
    @IBAction func redTextValueChanged(_ sender: UITextField) {
        if let currentValue = sender.text, !currentValue.isEmpty {
            if let convert = Float(currentValue) {
                UserDefaults.standard.set(convert, forKey: "redSlider")
                UserDefaults.standard.set(sender.text, forKey: "textFieldRed")
                redSlider.setValue(convert, animated: true)
            }
        } else {
            UserDefaults.standard.set(0, forKey: "redSlider")
            UserDefaults.standard.set(sender.text, forKey: "textFieldRed")
            redSlider.setValue(0, animated: true)
        }
    }
    
    @IBAction func greenTextValueChanged(_ sender: UITextField) {
        if let currentValue = sender.text, !currentValue.isEmpty {
            if let convert = Float(currentValue) {
                UserDefaults.standard.set(convert, forKey: "greenSlider")
                UserDefaults.standard.set(sender.text, forKey: "textFieldGreen")
                greenSlider.setValue(convert, animated: true)
            }
        } else {
            UserDefaults.standard.set(0, forKey: "greenSlider")
            UserDefaults.standard.set(sender.text, forKey: "textFieldGreen")
            greenSlider.setValue(0, animated: true)
        }
    }
    
    @IBAction func blueTextValueChanged(_ sender: UITextField) {
        if let currentValue = sender.text, !currentValue.isEmpty {
            if let convert = Float(currentValue) {
                UserDefaults.standard.set(convert, forKey: "blueSlider")
                UserDefaults.standard.set(sender.text, forKey: "textFieldBlue")
                blueSlider.setValue(convert, animated: true)
            }
        } else {
            UserDefaults.standard.set(0, forKey: "blueSlider")
            UserDefaults.standard.set(sender.text, forKey: "textFieldBlue")
            blueSlider.setValue(0, animated: true)
        }
    }
    
    
    /*
     move color view to user finger and drag around
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        colorView.center = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        colorView.center = location
    }
}

