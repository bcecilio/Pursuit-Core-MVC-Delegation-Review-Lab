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
    @IBOutlet weak var stepperLabel: UILabel!
    

    var currentFontSize: Int = 17 {
        didSet {
            stepperLabel.text = "Looking at \(stepperFont.value) Cohort."
        }
    }
    
    override func viewDidLoad() {
        configureStepper()
        configureSlider()
    }
    
    func configureStepper() {
        stepperFont.minimumValue = 10
        stepperFont.maximumValue = 36
        stepperFont.stepValue = 1
        stepperFont.value = 17
    }
    
    func configureSlider() {
        slider.minimumValue = 10
        slider.maximumValue = 36
        slider.value = 17
    }
    
    @IBAction func stepperFunction(_ sender: UIStepper) {
        currentFontSize = Int(stepperFont.value)
        slider.value = Float(sender.value)
        sliderStatus.text = Int(sender.value).description
    }

}
