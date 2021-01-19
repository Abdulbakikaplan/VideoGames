//
//  GamesViewController.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit
import iCarousel
import FirebaseAnalytics

class GamesViewController: UIViewController, StoryboardLoadable {

    @IBOutlet weak var carouselViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var carouselView: iCarousel!
    @IBOutlet private weak var pageControl: UIPageControl!

    var adapter: GamesTableViewAdapter?
    var carouselViewAdapter: CarouselViewAdapter?
    var isSearch: Bool = false {
        didSet {
            adapter?.isSearch = isSearch
            tableView.reloadData()
        }
    }

    // MARK: Properties

    var presenter: IGamesPresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("game", parameters: nil)
        prepareTableView()
        prepareCollectionView()
        searchBarDelegate()
        presenter?.viewDidLoad?()
    }

    private func prepareTableView() {
        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.registerCells([GameTableViewCell.self])
    }

    private func searchBarDelegate() {
        searchBar.delegate = self
    }

    private func prepareCollectionView() {
        carouselView.delegate = carouselViewAdapter
        carouselView.dataSource = carouselViewAdapter
    }

    private func dismmissKeyboard() {
        searchBar.resignFirstResponder()
    }

    private func hideView() {
        carouselView.isHidden = true
        carouselViewHeightConstraint.constant = 0
        pageControl.isHidden = true
        self.view.layoutIfNeeded()
    }

    private func showView() {
        pageControl.isHidden = false
        carouselView.isHidden = false
        carouselViewHeightConstraint.constant = 180
        self.view.layoutIfNeeded()
    }
}

extension GamesViewController: IGamesView {
    func reloadForSearch() {
        hideView()
        tableView.reloadData()
        adapter?.isSearch = true
    }

    func setPageControlCount(page: Int) {
        pageControl.numberOfPages = page
    }

    func currenPage(page: Int) {
        pageControl.currentPage = page
    }

    func reloadData() {
        tableView.reloadData()
        carouselView.reloadData()
    }
}

extension GamesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismmissKeyboard()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
        searchBar.text = ""
        showView()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        hideView()
        isSearch = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        showView()
        isSearch = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            Analytics.logEvent("didSearch", parameters: nil)
            hideView()
            presenter?.removeSearchResult()
            isSearch = true
            for game in presenter?.getGameList() ?? [] {
                if game.name.lowercased().contains(searchText.lowercased()) {
                    presenter?.searchResult(searchData: game)
                }
            }

            if presenter?.getSearchedResult().isEmpty == true {
                tableView.showEmptyLabel(message: "Aradığınız oyun bulunamadı", containerView: tableView.self)
            } else {
                tableView.hideEmptyLabel()
            }
        } else if searchText.count == 0 {
            isSearch = false
            showView()
            carouselView.reloadData()
            tableView.reloadData()
        }
    }
}
