//
//  NSObject+Ext.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
