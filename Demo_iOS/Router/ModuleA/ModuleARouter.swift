//
//  ModuleARouter.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
import UIKit

protocol ModuleARouterProtocol: AnyObject {
    func navigateToDetails(with university: UniversityModel)
}

class ModuleARouter: ModuleARouterProtocol {
    weak var viewController: UIViewController?
   
    func navigateToDetails(with university: UniversityModel) {
        let detailsView = ModuleBRouter.createModule(with: university)
        viewController?.navigationController?.pushViewController(detailsView, animated: true)
    }

    static func createModule() -> UIViewController {
        let view = ModuleAView()
        let presenter = ModuleAPresenter()
        let interactor = ModuleAInteractor(networkManager: NetworkManager(), databaseManager: DatabaseManager())
        let router = ModuleARouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
