//
//  CalculatorButton.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import SwiftUI

struct CalculatorButton: View {
	var color: Color
	var text: String
	var width: CGFloat
	var action: () -> Void
	var body: some View {
		Button(action: action) {
			Text(text)
				.foregroundColor(Color(.label))
		}
		.frame(width: width, height: 70)
		.background(
			RoundedRectangle(cornerRadius: 10, style: .continuous)
				.fill(color)
		)
	}
}


struct CalculatorButton_Previews: PreviewProvider {
	static var previews: some View {
		CalculatorButton(color: Color(.systemBlue), text: "=", width: 67) {}
	}
}
