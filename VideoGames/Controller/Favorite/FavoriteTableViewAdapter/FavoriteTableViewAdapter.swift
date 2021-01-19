//
//  FavoriteTableViewAdapter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//

import Foundation
import UIKit

class FavoriteTableViewAdapter: NSObject {
    private let presenter: IFavoritePresenter
    private let view: IFavoriteView

    init(presenter: IFavoritePresenter, view: IFavoriteView) {
        self.presenter = presenter
        self.view = view
    }
}

extension FavoriteTableViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        return  presenter.getCoreData().count
    }
}

extension FavoriteTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupGameTableViewCell(tableView: tableView, indexPath: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.routeToDetail(index: presenter.getCoreData()[indexPath.row].value(forKey: "id") as? Int ?? 0)
    }

    private func setupGameTableViewCell(tableView: UITableView, indexPath: Int) -> UITableViewCell {
        let identifier = GameTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if let cell = cell as? GameTableViewCell {
            cell.configureForCoreData(result: presenter.getCoreData()[indexPath])
            return cell
        }
        return UITableViewCell()
    }
}
