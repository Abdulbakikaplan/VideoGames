//
//  DetailInteractor.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//  
//

import Foundation

class DetailInteractor {

    // MARK: Properties

    weak var output: IDetailInteractorToPresenter?
}

extension DetailInteractor: IDetailInteractor {
    func getGameDetail(gameID: Int) {
        API.run.getGameDetail(gameID: gameID) { (detail, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.output?.getGameDetail(detail: detail!)
        }
    }
}
