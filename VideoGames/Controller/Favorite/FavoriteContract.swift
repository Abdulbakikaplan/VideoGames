//
//  FavoriteContract.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import CoreData
protocol IFavoriteView: IBaseView {
    func reloadData()
}

protocol IFavoritePresenter: IBasePresenter {
    func routeToDetail(index: Int)
    func getCoreData() -> [NSManagedObject]
}

protocol IFavoriteInteractor: class {
    func getCoreData()
}

protocol IFavoriteInteractorToPresenter: class {
    func getCoreData(data: [NSManagedObject])
}

protocol IFavoriteRouter: class {
    func routeToDetail(index: Int)
}
