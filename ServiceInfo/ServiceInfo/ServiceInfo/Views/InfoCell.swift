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
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor(named: "TextColor")
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = UIColor(named: "TextColor")
        nameLabel.numberOfLines = 0
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
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        self.contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
}
