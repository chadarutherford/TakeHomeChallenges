//
//  MediaCollectionViewCell.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .red
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension MediaCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}
