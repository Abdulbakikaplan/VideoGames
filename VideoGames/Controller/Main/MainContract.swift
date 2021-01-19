//
//  MainContract.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

protocol IMainView: IBaseView {
}

protocol IMainPresenter: IBasePresenter {
}

protocol IMainInteractor: class {
}

protocol IMainInteractorToPresenter: class {
}

protocol IMainRouter: class {
    func setTabBarRoutes(_ tabBarItemTypes: [MainTabBarItemType])
}
