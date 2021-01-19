//
//  MainTabBarItemType.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import UIKit

enum MainTabBarItemType: CaseIterable {

    case games
    case favorites

    var title: String {
        switch self {
        case .games: return "Oyunlar"
        case .favorites: return "Favoriler"

        }
    }

    var image: UIImage? {
        switch self {
        case .games: return UIImage.init(named: "game")
        case .favorites: return UIImage.init(named: "tabFavIcon")

        }
    }

    var isEnabled: Bool {
        switch self {
        case .games: return true
        case .favorites: return true
        }
    }

    var controller: UIViewController {
        switch self {
        case .games: return GamesRouter.setupModule()
        case .favorites: return FavoriteRouter.setupModule()

        }
    }
}
