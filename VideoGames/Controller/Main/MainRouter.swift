//
//  MainRouter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit

class MainRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MainViewController {
        let viewController = UIStoryboard.loadViewController() as MainViewController
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension MainRouter: IMainRouter {
    func setTabBarRoutes(_ tabBarItemTypes: [MainTabBarItemType]) {
        if let view = view as? MainViewController {
            view.viewControllers = tabBarItemTypes.map {
                let controller = $0.controller
                controller.tabBarItem = UITabBarItem(title: $0.title,
                                                     image: $0.image,
                                                     selectedImage: $0.image)
                controller.tabBarItem.isEnabled = $0.isEnabled
                return controller
            }
        }
    }
}
