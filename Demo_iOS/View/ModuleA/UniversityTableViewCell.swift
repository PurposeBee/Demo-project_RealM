//
//  UniversityTableViewCell.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {
    let universityConstantLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "University:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let countryConstantLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Country:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right") // Use SF Symbol for arrow
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(universityConstantLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(countryConstantLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            universityConstantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            universityConstantLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            universityConstantLabel.widthAnchor.constraint(equalToConstant: 100), // Fixed width
            universityConstantLabel.heightAnchor.constraint(equalToConstant: 20), // Fixed height
            
            nameLabel.leadingAnchor.constraint(equalTo: universityConstantLabel.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            countryConstantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            countryConstantLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            countryConstantLabel.widthAnchor.constraint(equalToConstant: 100), // Fixed width
            countryConstantLabel.heightAnchor.constraint(equalToConstant: 20), // Fixed height
            
            countryLabel.leadingAnchor.constraint(equalTo: countryConstantLabel.trailingAnchor, constant: 5),
            countryLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            countryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            countryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
