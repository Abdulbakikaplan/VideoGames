//
//  GamesRouter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit

class GamesRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> GamesViewController {
        let viewController = UIStoryboard.loadViewController() as GamesViewController
        let presenter = GamesPresenter()
        let router = GamesRouter()
        let interactor = GamesInteractor()
        let adapter = GamesTableViewAdapter(presenter: presenter, view: viewController)
        let carouselViewAdapter = CarouselViewAdapter(presenter: presenter, view: viewController)

        viewController.presenter =  presenter
        viewController.adapter = adapter
        viewController.carouselViewAdapter = carouselViewAdapter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension GamesRouter: IGamesRouter {
    func routeToDetail(index: Int) {
        view?.navigationController?.push(DetailRouter.setupModule(gameID: index))
    }
}
