//
//  UIWindow+Ext.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import UIKit

extension UIWindow {
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController  = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(rootViewController)
        }
        return nil
    }

    class func getVisibleViewControllerFrom(_ vc: UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(navigationController.visibleViewController!)

        } else if let tabBarController = vc as? UITabBarController {

            return UIWindow.getVisibleViewControllerFrom(tabBarController.selectedViewController!)

        } else if let
            pageViewController = vc as? UIPageViewController,
            let currentVC = pageViewController.viewControllers?.first {
            return UIWindow.getVisibleViewControllerFrom(currentVC)

        } else {

            if let presentedViewController = vc.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(presentedViewController)

            } else {
                return vc
            }
        }
    }
}
