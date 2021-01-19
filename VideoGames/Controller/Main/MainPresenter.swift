//
//  MainPresenter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

class MainPresenter {

    // MARK: Properties

    weak var view: IMainView?
    var router: IMainRouter?
    var interactor: IMainInteractor?
}

extension MainPresenter: IMainPresenter {

    func viewDidLoad() {
        router?.setTabBarRoutes(MainTabBarItemType.allCases)
    }
}

extension MainPresenter: IMainInteractorToPresenter {
}
