//
//  MediaCollectionViewCell.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
	
	let previewImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .blue
		imageView.layer.cornerRadius = 15
		imageView.layer.cornerCurve = .continuous
		return imageView
	}()
	
	let linkButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(.link, for: .normal)
		button.backgroundColor = .systemBackground
		button.tintColor = .systemGray
		button.layer.cornerRadius = 4
		button.layer.borderColor = UIColor.systemGray.cgColor
		button.layer.borderWidth = 0.5
		button.layer.masksToBounds = true
		return button
	}()
	
	let downloadButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(.download, for: .normal)
		button.backgroundColor = .systemBackground
		button.tintColor = .systemGray
		button.layer.cornerRadius = 4
		button.layer.borderColor = UIColor.systemGray.cgColor
		button.layer.borderWidth = 0.5
		button.layer.masksToBounds = true
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureUI() {
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(previewImageView)
		contentView.addSubview(linkButton)
		contentView.addSubview(downloadButton)
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			previewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			previewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			linkButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
			linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
			linkButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
			linkButton.heightAnchor.constraint(equalToConstant: 40),
			linkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

			downloadButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
			downloadButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
			downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
			downloadButton.heightAnchor.constraint(equalToConstant: 40),
			downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
		])
	}
}

extension MediaCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}
