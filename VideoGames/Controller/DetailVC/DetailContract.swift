//
//  DetailContract.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//  
//

import Foundation

protocol IDetailView: IBaseView {
    func setDetailData(gameDetail: GameDetail)
    func setFavoroite(isFav: Bool)
}

protocol IDetailPresenter: IBasePresenter {
    func setGameID(gameID: Int)
    func setFavoroite(isFav: Bool)
    func setViewFav(isFav: Bool)
}

protocol IDetailInteractor: class {
    func getGameDetail(gameID: Int)
}

protocol IDetailInteractorToPresenter: class {
    func getGameDetail(detail: GameDetail)
}

protocol IDetailRouter: class {
}
