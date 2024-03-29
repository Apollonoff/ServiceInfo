//
//  InfoCell.swift
//  ServiceInfo
//
//  Created by Arseniy Apollonov on 29.03.2024.
//

import UIKit
import Kingfisher

final class InfoCell: UITableViewCell {
    
    static let identifier = "InfoCell"
    
    private let titleLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.textColor = UIColor(named: "TextColor")
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor(named: "TextColor")
        nameLabel.numberOfLines = 3
        return nameLabel
    }()
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(named: "BackgroundColor")
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureInfoCell(title: String?, description: String?, image_url: URL) {
        titleLabel.text = title
        descriptionLabel.text = description
//        iconImage.imageFrom(url: image_url)
        iconImage.kf.setImage(with: image_url)
    }
    
    // MARK: - Layouts
    private func setupCell() {
        self.contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            iconImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
            iconImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10)
        ])
        
        self.contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
}
