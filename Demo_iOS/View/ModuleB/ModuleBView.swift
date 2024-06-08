//
//  ModuleBView.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
import UIKit

protocol ModuleBViewProtocol: AnyObject {
    func displayUniversityDetails(_ university: UniversityModel)
}

class ModuleBView: UIViewController, ModuleBViewProtocol {
    var presenter: ModuleBPresenterProtocol?
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allows the label to wrap text
        label.textAlignment = .center
        return label
    }()
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allows the label to wrap text
        label.textAlignment = .center
        return label
    }()
    
    private let webPageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allows the label to wrap text
        label.textAlignment = .center
        return label
    }()

    // Constant labels
    private let universityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "University Name:"
        return label
    }()
    
    private let domainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Domain:"
        return label
    }()
    
    private let webPageTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Web Pages:"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabels()
        presenter?.viewDidLoad()
    }

    private func setupLabels() {
        view.addSubview(universityNameLabel)
        view.addSubview(domainTextLabel)
        view.addSubview(webPageTextLabel)
        view.addSubview(nameLabel)
        view.addSubview(domainLabel)
        view.addSubview(webPageLabel)

        NSLayoutConstraint.activate([
            universityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            universityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: universityNameLabel.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            domainTextLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            domainTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            domainLabel.topAnchor.constraint(equalTo: domainTextLabel.bottomAnchor, constant: 8),
            domainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            domainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            webPageTextLabel.topAnchor.constraint(equalTo: domainLabel.bottomAnchor, constant: 20),
            webPageTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            webPageLabel.topAnchor.constraint(equalTo: webPageTextLabel.bottomAnchor, constant: 8),
            webPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            webPageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func displayUniversityDetails(_ university: UniversityModel) {
        nameLabel.text = university.name
        domainLabel.text = university.domains.joined(separator: ", ")
        webPageLabel.text = university.webPages.joined(separator: ", ")
    }
}
