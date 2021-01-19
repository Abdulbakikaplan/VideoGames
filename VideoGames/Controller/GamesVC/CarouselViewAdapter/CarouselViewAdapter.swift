//
//  GamesCollectionViewAdapter.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation
import UIKit
import iCarousel

class CarouselViewAdapter: NSObject {

    private let presenter: IGamesPresenter
    private let view: IGamesView

    init(presenter: IGamesPresenter, view: IGamesView) {
        self.presenter = presenter
        self.view = view
    }
}

extension CarouselViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        return presenter.getGameList().count
    }
}

extension CarouselViewAdapter: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return itemCount()
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView.init()
        imageView.frame = CGRect.init(x: 0,
                                      y: 0,
                                      width: carousel.frame.width - 20,
                                      height: carousel.frame.height)
        imageView.kf.setImage(with:
                                URL(string: presenter.getGameList()[index].background_image))
        return imageView
    }

    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .spacing {
            return value * 1.2
        }
        return value
    }

    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        view.currenPage(page: carousel.currentItemIndex)
    }

    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        presenter.routeToDetail(index: presenter.getGameList()[index].id)
    }
}
