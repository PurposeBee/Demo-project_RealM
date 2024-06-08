//
//  ModuleAPresenter.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation

protocol ModuleAPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectUniversity(_ university: UniversityModel)
}

class ModuleAPresenter: ModuleAPresenterProtocol {
    weak var view: ModuleAViewProtocol?
    var interactor: ModuleAInteractorInputProtocol?
    var router: ModuleARouterProtocol?

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }

    func didSelectUniversity(_ university: UniversityModel) {
        router?.navigateToDetails(with: university)
    }
}

extension ModuleAPresenter: ModuleAInteractorOutputProtocol {
    func didFetchUniversities(_ universities: [University]) {
        DispatchQueue.main.async {
            self.view?.displayUniversities(universities)
        }
    }

    func didFailWithError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.displayError(error)
        }
    }
}

