//
//  MainInteractor.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

class MainInteractor {

    // MARK: Properties

    weak var output: IMainInteractorToPresenter?
}

extension MainInteractor: IMainInteractor {
}
