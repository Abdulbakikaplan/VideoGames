//
//  FavoritePresenter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import CoreData

class FavoritePresenter {

    // MARK: Properties

    weak var view: IFavoriteView?
    var router: IFavoriteRouter?
    var interactor: IFavoriteInteractor?
    var coreData: [NSManagedObject] = []
}

extension FavoritePresenter: IFavoritePresenter {
    func getCoreData() -> [NSManagedObject] {
        return coreData
    }

    func routeToDetail(index: Int) {
        router?.routeToDetail(index: index)
    }

    func viewDidLoad() {
        interactor?.getCoreData()
    }

    func viewWillAppear() {
        interactor?.getCoreData()
    }
}

extension FavoritePresenter: IFavoriteInteractorToPresenter {
    func getCoreData(data: [NSManagedObject]) {
        self.coreData = data
        view?.reloadData()
    }
}
