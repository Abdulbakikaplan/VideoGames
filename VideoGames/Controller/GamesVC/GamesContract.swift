//
//  GamesContract.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

protocol IGamesView: IBaseView {
    func reloadData()
    func reloadForSearch()
    func currenPage(page: Int)
    func setPageControlCount(page: Int)
}

protocol IGamesPresenter: IBasePresenter {
    func getGameList() -> [Game]
    func routeToDetail(index: Int)
    func searchResult(searchData: Game)
    func getSearchedResult() -> [Game]
    func removeSearchResult()
}

protocol IGamesInteractor: class {
    func getGames(appendData: Bool)
}

protocol IGamesInteractorToPresenter: class {
    func gamesList(list: [Game])
}

protocol IGamesRouter: class {
    func routeToDetail(index: Int)
}
