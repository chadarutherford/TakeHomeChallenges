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
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let videoPreview: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .blue
		view.layer.cornerRadius = 15
		view.layer.cornerCurve = .continuous
		return view
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
	
	var campaignController: CampaignController?
	var media: Media? {
		didSet {
			updateViews()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		previewImageView.image = nil
	}
	
	private func configureVideoPreview() {
		videoPreview.removeFromSuperview()
		previewImageView.removeFromSuperview()
		contentView.addSubview(videoPreview)
		NSLayoutConstraint.activate([
			videoPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			videoPreview.topAnchor.constraint(equalTo: contentView.topAnchor),
			videoPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			linkButton.topAnchor.constraint(equalTo: videoPreview.bottomAnchor, constant: 8),
			downloadButton.topAnchor.constraint(equalTo: videoPreview.bottomAnchor, constant: 8),
		])
	}
	
	private func configureImageView() {
		videoPreview.removeFromSuperview()
		previewImageView.removeFromSuperview()
		contentView.addSubview(previewImageView)
		NSLayoutConstraint.activate([
			previewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			previewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			linkButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
			downloadButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
		])
	}
	
	private func configureUI() {
		
		contentView.addSubview(linkButton)
		contentView.addSubview(downloadButton)
		NSLayoutConstraint.activate([
			linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
			linkButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
			linkButton.heightAnchor.constraint(equalToConstant: 40),
			linkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
			
			downloadButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
			downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
			downloadButton.heightAnchor.constraint(equalToConstant: 40),
			downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
		])
	}
	
	private func updateViews() {
		guard let media = media,
			  let campaignController = campaignController
		else { return }
		configureImageView()
		campaignController.fetchImage(for: media.coverPhotoURL) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let image):
				self.previewImageView.image = image
			case .failure(let error):
				print(error)
			}
		}
	}
}

extension MediaCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}
