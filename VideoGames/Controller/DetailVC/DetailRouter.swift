//
//  DetailRouter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//  
//

import Foundation
import UIKit

class DetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(gameID: Int) -> DetailViewController {
        let viewController = UIStoryboard.loadViewController() as DetailViewController
        let presenter = DetailPresenter()
        let router = DetailRouter()
        let interactor = DetailInteractor()

        viewController.presenter =  presenter
        viewController.gameID = gameID
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension DetailRouter: IDetailRouter {
}
