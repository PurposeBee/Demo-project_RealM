//
//  ModuleBPresenter.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
protocol ModuleBPresenterProtocol: AnyObject {
    func viewDidLoad()
}

class ModuleBPresenter: ModuleBPresenterProtocol {
    weak var view: ModuleBViewProtocol?
    var interactor: ModuleBInteractorInputProtocol?
    var router: ModuleBRouterProtocol?
    var university: UniversityModel

    init(university: UniversityModel) {
        self.university = university
    }

    func viewDidLoad() {
        view?.displayUniversityDetails(university)
    }
}
