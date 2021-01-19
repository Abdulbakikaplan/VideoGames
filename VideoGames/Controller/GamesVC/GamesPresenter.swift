//
//  GamesPresenter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation

class GamesPresenter {

    // MARK: Properties
    weak var view: IGamesView?
    var router: IGamesRouter?
    var interactor: IGamesInteractor?
    private var games: [Game]?
    private var searchedGames: [Game]? = [] {
        didSet {
            view?.reloadForSearch()
        }
    }
    var searchResult: [Game] = []
}

extension GamesPresenter: IGamesPresenter {
    func removeSearchResult() {
        searchedGames?.removeAll()
    }

    func getSearchedResult() -> [Game] {
        return searchedGames ?? []
    }

    func searchResult(searchData: Game) {
        searchedGames?.append(searchData)
    }

    func routeToDetail(index: Int) {
        router?.routeToDetail(index: index)
    }

    func getGameList() -> [Game] {
        return games ?? []
    }

    func viewDidLoad() {
        view?.showProgressHUD()
        interactor?.getGames(appendData: false)
    }
}

extension GamesPresenter: IGamesInteractorToPresenter {
    func gamesList(list: [Game]) {
        view?.setPageControlCount(page: list.count)
        self.games = list
        view?.reloadData()
        view?.hideProgressHUD()
    }
}
