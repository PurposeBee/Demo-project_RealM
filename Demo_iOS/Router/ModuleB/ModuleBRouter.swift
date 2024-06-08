//
//  ModuleBRouter.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
import UIKit

protocol ModuleBRouterProtocol: AnyObject {}

class ModuleBRouter: ModuleBRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule(with university: UniversityModel) -> UIViewController {
        let view = ModuleBView()
        let presenter = ModuleBPresenter(university: university)
        let interactor = ModuleBInteractor()
        let router = ModuleBRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view

        return view
    }
}
