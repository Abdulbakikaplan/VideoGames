//
//  SplashContract.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

protocol ISplashView: IBaseView {
}

protocol ISplashPresenter: class {
    func navigateToGames()
}

protocol ISplashInteractor: class {
}

protocol ISplashInteractorToPresenter: class {
}

protocol ISplashRouter: class {
    func navigateToGames()
}
