//
//  DetailViewController.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//  
//

import Foundation
import UIKit
import FirebaseAnalytics

class DetailViewController: UIViewController, StoryboardLoadable {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var metaricticLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var favButton: UIButton!

    var gameID: Int?
    var isFav: Bool = false

    // MARK: Properties

    var presenter: IDetailPresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("detail", parameters: nil)
        isFav = CoreDataManager.run.checkCoreData(gameID ?? 0)
        presenter?.setViewFav(isFav: isFav)
        presenter?.setGameID(gameID: gameID ?? 0)
        presenter?.viewDidLoad?()
    }

    @IBAction private func heartButtonTapped(_ sender: Any) {
        presenter?.setFavoroite(isFav: isFav)
    }

}

extension DetailViewController: IDetailView {
    func setFavoroite(isFav: Bool) {
        if isFav == true {
            self.favButton.setImage(UIImage.init(named: "heart_filled"), for: .normal)
            self.isFav = true
        } else {
            self.favButton.setImage(UIImage.init(named: "heart"), for: .normal)
            self.isFav = false
        }
    }

    func setDetailData(gameDetail: GameDetail) {
        gameImageView.kf.setImage(with: URL(string: gameDetail.background_image))
        nameLabel.text = gameDetail.name
        releaseLabel.text = gameDetail.released
        metaricticLabel.text = gameDetail.metacritic?.double
        descriptionTextView.text = gameDetail.gameDescription.replacingOccurrences(of: "<[^>]+>",
            with: "",
            options: String.CompareOptions.regularExpression,
            range: nil)
        self.view.layoutIfNeeded()
    }
}
