//
//  FavoriteRouter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit

class FavoriteRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> FavoriteViewController {
        let viewController = UIStoryboard.loadViewController() as FavoriteViewController
        let presenter = FavoritePresenter()
        let router = FavoriteRouter()
        let interactor = FavoriteInteractor()
        let adapter = FavoriteTableViewAdapter(presenter: presenter, view: viewController)

        viewController.adapter = adapter
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

extension FavoriteRouter: IFavoriteRouter {
    func routeToDetail(index: Int) {
        view?.navigationController?.push(DetailRouter.setupModule(gameID: index))
    }
}
