//
//  CalculatorViewModel.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Properties
	@Published var display = "0"
	@Published var userIsTyping = false
	
	var displayValue: Double {
		get {
			Double(display)!
		}
		
		set {
			if newValue.isInt {
				display = String(format: "%.0f", newValue)
			} else {
				display = String(format: "%.12f", newValue)
			}
		}
	}
}
