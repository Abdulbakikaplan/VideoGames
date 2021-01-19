//
//  GamesTableViewAdapter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import UIKit

class GamesTableViewAdapter: NSObject {

    private let presenter: IGamesPresenter
    private let view: IGamesView
    var isSearch: Bool = false

    init(presenter: IGamesPresenter, view: IGamesView) {
        self.presenter = presenter
        self.view = view
    }
}

extension GamesTableViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        if isSearch {
            return presenter.getSearchedResult().count
        } else {
            return presenter.getGameList().count
        }
    }

    func getGameList() -> [Game] {
        if isSearch {
            return presenter.getSearchedResult()
        } else {
            return presenter.getGameList()
        }
    }
}

extension GamesTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupGameTableViewCell(tableView: tableView, indexPath: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearch == true {
            presenter.routeToDetail(index: presenter.getSearchedResult()[indexPath.row].id)
        } else {
            presenter.routeToDetail(index: presenter.getGameList()[indexPath.row].id)
        }
    }

    private func setupGameTableViewCell(tableView: UITableView, indexPath: Int) -> UITableViewCell {
        let identifier = GameTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if let cell = cell as? GameTableViewCell {
            if isSearch == true {
                cell.setupCell(result: presenter.getSearchedResult()[indexPath])
            } else {
                cell.setupCell(result: presenter.getGameList()[indexPath])
            }
            return cell
        }
        return UITableViewCell()
    }
}
