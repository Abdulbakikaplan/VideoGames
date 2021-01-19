//
//  FavoriteViewController.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit
import FirebaseAnalytics

class FavoriteViewController: UIViewController, StoryboardLoadable {

    @IBOutlet private weak var tableView: UITableView!

    // MARK: Properties

    var presenter: IFavoritePresenter?
    var adapter: FavoriteTableViewAdapter?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("favorite", parameters: nil)
        prepareTableView()
        presenter?.viewDidLoad?()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear?()
    }

    fileprivate func prepareTableView() {
        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.registerCells([GameTableViewCell.self])
    }
}

extension FavoriteViewController: IFavoriteView {
    func reloadData() {
        tableView.reloadData()
    }
}
