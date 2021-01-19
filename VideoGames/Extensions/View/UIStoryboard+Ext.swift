//
//  UIStoryboard+Ext.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        return UIStoryboard(name: T.storyboardName(),
                            bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
        // swiftlint:disable:previous force_cast
    }
}
