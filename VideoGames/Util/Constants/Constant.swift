//
//  Constant.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation

class Constants {
    static let shared = Constants()

    let gameCellProperty = "GameCell"
    let toGameDetail = "toGameDetail"

    let requestURL = "https://rawg-video-games-database.p.rapidapi.com/games"
    let requestHeaders = [
        "x-rapidapi-key": "1c5fd4f1b8mshe0faf872262e44dp1ab641jsn3a548c1112f8",
        "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com"
    ]
}
