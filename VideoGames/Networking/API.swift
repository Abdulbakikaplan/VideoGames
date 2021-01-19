//
//  API.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import Alamofire

class API {
    static let run = API()

    func getGames(completionHandler: @escaping(_ data: Games?, _ error: Error?) -> Void) {
        AF.request(Constants.shared.requestURL,
                   method: .get,
                   parameters: nil,
                   headers: HTTPHeaders.init(Constants.shared.requestHeaders),
                   interceptor: nil,
                   requestModifier: nil).response { (response) in
            if let data = response.data {
                do {
                    let data = try JSONDecoder.init().decode(Games.self, from: data)
                    completionHandler(data, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }

    func getGameDetail(gameID: Int, completionHandler: @escaping(_ gameDetail: GameDetail?, _ error: Error?) -> Void) {
        AF.request(Constants.shared.requestURL + "/\(gameID)", method: .get, parameters: nil, headers: HTTPHeaders.init(Constants.shared.requestHeaders), interceptor: nil, requestModifier: nil).response { (response) in
            if let data = response.data {
                do {
                    let details = try JSONDecoder.init().decode(GameDetail.self, from: data)
                    completionHandler(details, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
