//
//  ModuleAInteractor.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
protocol ModuleAInteractorInputProtocol: AnyObject {
    func fetchUniversities()
}

protocol ModuleAInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailWithError(_ error: String)
}

class ModuleAInteractor: ModuleAInteractorInputProtocol {
    weak var presenter: ModuleAInteractorOutputProtocol?
    let networkManager: NetworkManager
    let databaseManager: DatabaseManager

    init(networkManager: NetworkManager, databaseManager: DatabaseManager) {
        self.networkManager = networkManager
        self.databaseManager = databaseManager
    }

    func fetchUniversities() {
        networkManager.fetchUniversities { [weak self] result in
            switch result {
            case .success(let universities):
                self?.databaseManager.saveUniversities(universities) {
                    // After saving universities, notify the presenter
                    self?.presenter?.didFetchUniversities(universities)
                }
            case .failure(let error):
                self?.databaseManager.loadUniversities { cachedUniversities in
                    if cachedUniversities.isEmpty {
                        self?.presenter?.didFailWithError(error.localizedDescription)
                    } else {
                        self?.presenter?.didFetchUniversities(cachedUniversities)
                    }
                }
            }
        }
    }

}
