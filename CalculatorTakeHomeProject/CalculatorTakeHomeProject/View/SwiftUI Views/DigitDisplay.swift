//
//  DigitDisplay.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 9/1/20.
//

import SwiftUI

struct DigitDisplay: View {
	
	@EnvironmentObject var viewModel: CalculatorViewModel
	
    var body: some View {
        Rectangle()
			.fill(Color.clear)
			.frame(height: 50)
			.overlay(
				Text(viewModel.display)
					.font(.largeTitle)
					.frame(maxWidth: 350, alignment: .trailing)
					.padding(.horizontal)
			)
    }
}

struct DigitDisplay_Previews: PreviewProvider {
    static var previews: some View {
        DigitDisplay()
    }
}
