//
//  GamesInteractor.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import Alamofire

class GamesInteractor {

    // MARK: Properties

    weak var output: IGamesInteractorToPresenter?
    var data: Games?

}

extension GamesInteractor: IGamesInteractor {
    func getGames(appendData: Bool) {
        API.run.getGames { (games, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            self.output?.gamesList(list: games?.results ?? [])
        }
    }
}
