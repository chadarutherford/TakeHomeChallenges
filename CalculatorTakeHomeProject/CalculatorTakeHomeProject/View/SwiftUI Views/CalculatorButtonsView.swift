//
//  CalculatorButtonsView.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import SwiftUI

struct CalculatorButtonsView: View {
	
	let buttons = [["C", "÷"],
				   ["7", "8", "9", "x"],
				   ["4", "5", "6", "-"]]
	
	@EnvironmentObject var viewModel: CalculatorViewModel
	@Binding var brain: CalculatorBrain
	
    var body: some View {
		ForEach(buttons, id: \.self) { rowDigits in
			HStack(spacing: 20) {
				ForEach(rowDigits, id: \.self) { digit in
					if digit == "C" {
						CalculatorButton(color: .clearButton, text: digit, width: 240) {
							viewModel.display = "0"
						}
					} else if digit == "7" {
						CalculatorButton(color: .seven, text: digit, width: 67) {
							if viewModel.userIsTyping {
								viewModel.display += digit
							} else {
								viewModel.display = digit
								viewModel.userIsTyping = true
							}
						}
					} else {
						CalculatorButton(color: .buttons, text: digit, width: 67) {
							if Int(digit) == nil {
								brain.setOperand(viewModel.displayValue)
								brain.performOperation(digit)
								if let result = brain.result {
									viewModel.displayValue = result
								}
								viewModel.userIsTyping = false
							}
						}
					}
				}
			}
		}
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
		CalculatorButtonsView(brain: .constant(CalculatorBrain()))
    }
}
