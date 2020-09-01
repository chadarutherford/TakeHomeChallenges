//
//  FloatingPoint+Ext.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import Foundation

extension FloatingPoint {
	var isInt: Bool {
		floor(self) == self
	}
}
