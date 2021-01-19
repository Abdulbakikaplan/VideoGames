//
//  FavoriteInteractor.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

class FavoriteInteractor {

    // MARK: Properties

    weak var output: IFavoriteInteractorToPresenter?
}

extension FavoriteInteractor: IFavoriteInteractor {
    func getCoreData() {
        CoreDataManager.run.getGames { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self.output?.getCoreData(data: result ?? [])
        }
    }
}
