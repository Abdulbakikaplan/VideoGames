//
//  DetailPresenter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//  
//

import Foundation

class DetailPresenter {

    // MARK: Properties

    weak var view: IDetailView?
    var router: IDetailRouter?
    var interactor: IDetailInteractor?
    var gameDetail: GameDetail?
    var gameID: Int?
}

extension DetailPresenter: IDetailPresenter {
    func setViewFav(isFav: Bool) {
        view?.setFavoroite(isFav: isFav)
    }

    func setFavoroite(isFav: Bool) {
        if let game = gameDetail {
            if !isFav {
                CoreDataManager.run.saveGame(game.id,
                                             game.name,
                                             game.released,
                                             game.background_image,
                                             game.rating,
                                             game.rating_top) { (result, err) in
                    if let err = err {
                        print(err.localizedDescription)
                        return
                    }
                    self.view?.setFavoroite(isFav: true)
                }
            } else {
                if CoreDataManager.run.deleteGame(gameID!) {
                    self.view?.setFavoroite(isFav: false)
                } else {
                }
            }
        }
    }

    func setGameID(gameID: Int) {
        self.gameID = gameID
    }

    func viewDidLoad() {
        interactor?.getGameDetail(gameID: gameID ?? 0)
    }
}

extension DetailPresenter: IDetailInteractorToPresenter {
    func getGameDetail(detail: GameDetail) {
        self.gameDetail = detail
        view?.setDetailData(gameDetail: detail)
    }
}
