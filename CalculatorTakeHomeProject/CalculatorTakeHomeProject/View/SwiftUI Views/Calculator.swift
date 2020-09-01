//
//  ContentView.swift
//  CalculatorTakeHomeProject
//
//  Created by Chad Rutherford on 8/31/20.
//

import SwiftUI

struct Calculator: View {
	
	@EnvironmentObject var viewModel: CalculatorViewModel
	
    var body: some View {
		ZStack {
			Rectangle()
				.stroke()
				.frame(width: 350, height: 540)
				.overlay(
					VStack(spacing: 20) {
						DigitDisplay()
				}
			)
		}
		.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()
			.environmentObject(CalculatorViewModel())
			.preferredColorScheme(.dark)
    }
}
