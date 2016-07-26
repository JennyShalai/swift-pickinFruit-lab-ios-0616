//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.accessibilityLabel = Constants.FRUIT_PICKER
        // self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickFruit()
        
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        self.pickFruit()
        if (Int(self.pickerView.selectedRowInComponent(0).description)! % self.fruitsArray.count) == (Int(self.pickerView.selectedRowInComponent(1).description)! % self.fruitsArray.count) && (Int(self.pickerView.selectedRowInComponent(1).description)! % self.fruitsArray.count) == (Int(self.pickerView.selectedRowInComponent(2).description)! % self.fruitsArray.count) {
            self.resultLabel.text = "WINNER!"
        } else {
            self.resultLabel.text = "TRY AGAIN"
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    func pickFruit() {
        for i in 0...2 {
            let randomInt = Int(arc4random_uniform(UInt32(100)))
            self.pickerView.selectRow(randomInt, inComponent: i, animated: true)
        }
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



