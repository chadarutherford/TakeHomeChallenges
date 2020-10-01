//
//  FeedCollectionViewCell.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
	
	let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 15
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		return label
	}()
	
	let payLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		label.textColor = .payPerInstallColor
		return label
	}()
	
	let payPerInstallLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "per install"
		label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
		label.textColor = .payPerInstallColor
		return label
	}()
	
	var campaignController: CampaignController?
	var campaign: Campaign? {
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
	
	private func configureUI() {
		contentView.addSubview(iconImageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(payLabel)
		contentView.addSubview(payPerInstallLabel)
		NSLayoutConstraint.activate([
			iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			iconImageView.heightAnchor.constraint(equalToConstant: 60),
			iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1),
			
			nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
			nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -20),
			nameLabel.heightAnchor.constraint(equalToConstant: 20),
			
			payLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			payLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			payLabel.heightAnchor.constraint(equalToConstant: 25),
			payLabel.trailingAnchor.constraint(equalTo: payPerInstallLabel.leadingAnchor, constant: -4),
			
			payPerInstallLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			payPerInstallLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor),
			payPerInstallLabel.heightAnchor.constraint(equalToConstant: 25)
		])
	}
	
	private func updateViews() {
		guard let campaign = campaign,
			  let campaignController = campaignController
		else { return }
		campaignController.fetchImage(for: campaign.iconURL) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let image):
				self.iconImageView.image = image
			case .failure(let error):
				print(error)
			}
		}
		nameLabel.text = campaign.name
		payLabel.text = campaign.payPerInstall
	}
}

extension FeedCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}
