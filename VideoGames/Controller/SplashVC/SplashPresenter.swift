//
//  SplashPresenter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

class SplashPresenter {

    // MARK: Properties

    weak var view: ISplashView?
    var router: ISplashRouter?
    var interactor: ISplashInteractor?
}

extension SplashPresenter: ISplashPresenter {
    func navigateToGames() {
        router?.navigateToGames()
    }
}

extension SplashPresenter: ISplashInteractorToPresenter {
}
