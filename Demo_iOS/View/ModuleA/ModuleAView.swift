//
//  ModuleAView.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import UIKit

protocol ModuleAViewProtocol: AnyObject {
    func displayUniversities(_ universities: [University])
    func displayError(_ error: String)
}

class ModuleAView: UIViewController, ModuleAViewProtocol {
    var presenter: ModuleAPresenterProtocol?
    private var universities = [University]()
    private var universitiesModel = [UniversityModel]()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UniversityTableViewCell.self, forCellReuseIdentifier: "UniversityCell")
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        presenter?.viewDidLoad()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func displayUniversities(_ universities: [University]) {
        DatabaseManager.sharedQueue.async {
            // Convert [University] to [UniversityModel]
            let universityModels = universities.map { university in
                UniversityModel(alphaTwoCode: university.alpha_two_code, domains: university.domains, name: university.name, webPages: university.web_pages, country: university.country, stateProvince: university.state_province)
            }

            // Assign universityModels to the property
            self.universitiesModel = universityModels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func displayError(_ error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ModuleAView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universitiesModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as? UniversityTableViewCell else {
            return UITableViewCell()
        }
        let university = universitiesModel[indexPath.row]
        cell.nameLabel.text = university.name
        cell.countryLabel.text = university.country
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let university = universitiesModel[indexPath.row]
        presenter?.didSelectUniversity(university)
    }
}
