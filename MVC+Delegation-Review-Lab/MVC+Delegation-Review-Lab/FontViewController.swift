//
//  FontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Brendon Cecilio on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderStatus: UILabel!
    @IBOutlet weak var stepperFont: UIStepper!

    var currentFontSize: Int = 17 {
        didSet {
            
        }
    }
    
    @IBAction func stepperFunction(_ sender: UIStepper) {
        stepperFont.value = sender.value
        slider.value = Float(sender.value)
        sliderStatus.text = Int(sender.value).description
    }

}
