//
//  MainViewController.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit

class MainViewController: BaseTabBarController, StoryboardLoadable {

    // MARK: Properties

    var presenter: IMainPresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
    }
}

extension MainViewController: IMainView {
}
