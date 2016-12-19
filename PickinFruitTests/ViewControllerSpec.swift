//
//  ViewControllerSpec.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import XCTest
import Foundation
import Quick
import Nimble
import KIF
@testable import PickinFruit

class ViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        let tester = KIFUITestActor()
        
        describe("fruit slot machine") {
            
            it("should say 'TRY AGAIN' when you do not get three of the same fruit across the spinner") {
                
                let pickerView = tester.waitForView(withAccessibilityLabel: Constants.FRUIT_PICKER) as! UIPickerView
                let appDelegate = UIApplication.shared.delegate
                let vc = appDelegate!.window!?.rootViewController as! ViewController
                
                vc.fruitsArray = (0..<26).map({String(UnicodeScalar("a".unicodeScalars.first!.value + $0))})
                
                pickerView.reloadAllComponents()
                
                tester.wait(forTimeInterval: 3.0)
                
                tester.waitForTappableView(withAccessibilityLabel: Constants.SPIN_BUTTON)
                tester.tapView(withAccessibilityLabel: Constants.SPIN_BUTTON)
                
                tester.waitForAnimationsToFinish(withTimeout: 3.0)
                
                expect(vc.resultLabel.text).to(equal("TRY AGAIN"))

            }
            
            it("should say 'WINNER!' when you do get three of the same fruit across the spinner") {
                
                let pickerView = tester.waitForView(withAccessibilityLabel: Constants.FRUIT_PICKER) as! UIPickerView
                let appDelegate = UIApplication.shared.delegate
                let vc = appDelegate!.window!?.rootViewController as! ViewController
                
                vc.fruitsArray = ["a"]
                
                pickerView.reloadAllComponents()
                
                tester.wait(forTimeInterval: 3.0)
                
                tester.waitForTappableView(withAccessibilityLabel: Constants.SPIN_BUTTON)
                tester.tapView(withAccessibilityLabel: Constants.SPIN_BUTTON)
                
                tester.waitForAnimationsToFinish(withTimeout: 3.0)
                
                expect(vc.resultLabel.text).to(equal("WINNER!"))
                
            }
                
        }
            
    }

}





