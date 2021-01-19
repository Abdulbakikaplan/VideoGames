//
//  UINavigation+Ext.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 17.01.2021.
//

import Foundation
import UIKit

extension UINavigationController {
    func push(_ vC: UIViewController) {
        self.pushViewController(vC, animated: false)
    }
}
