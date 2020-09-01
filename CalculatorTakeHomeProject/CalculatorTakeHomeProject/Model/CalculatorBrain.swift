//
//  CalculatorBrain.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import Foundation

struct CalculatorBrain {
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Properties
	private enum Operation {
		case binaryOperation((Double, Double) -> Double)
		case equals
	}
	
	private var operations: [String: Operation] = [
		"x" : .binaryOperation( { $0 * $1} ),
		"÷" : .binaryOperation( { $0 / $1} ),
		"+" : .binaryOperation( { $0 + $1} ),
		"-" : .binaryOperation( { $0 - $1} ),
		"=" : .equals
	]
	
	private var accumulator: Double?
	private var pendingOperation: PendingBinaryOperation?
	var result: Double? {
		accumulator
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Private Struct
	private struct PendingBinaryOperation {
		let function: (Double, Double) -> Double
		let firstOperand: Double
		
		func perform(with secondOperand: Double) -> Double {
			function(firstOperand, secondOperand)
		}
	}
	
	private mutating func performPendingBinaryOperation() {
		if pendingOperation != nil && accumulator != nil {
			accumulator = pendingOperation!.perform(with: accumulator!)
			pendingOperation = nil
		}
	}
	
	mutating func performOperation(_ symbol: String) {
		if let operation = operations[symbol] {
			switch operation {
			case .binaryOperation(let function):
				if accumulator != nil {
					pendingOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
					accumulator = nil
				}
			case .equals:
				performPendingBinaryOperation()
			}
		}
	}
	
	mutating func setOperand(_ operand: Double) {
		accumulator = operand
	}
}
