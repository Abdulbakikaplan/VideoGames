//
//  SplashViewController.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//  
//

import Foundation
import UIKit
import FirebaseAnalytics

class SplashViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: ISplashPresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("splash", parameters: nil)
        presenter?.navigateToGames()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension SplashViewController: ISplashView {
}
