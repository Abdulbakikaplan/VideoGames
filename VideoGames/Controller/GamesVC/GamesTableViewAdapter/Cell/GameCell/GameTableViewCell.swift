//
//  GameTableViewCell.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import UIKit
import Kingfisher
import CoreData

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameRatingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(result: Game) {
        gameImageView.kf.setImage(with: URL(string: result.background_image))
        gameNameLabel.text = result.name
        gameRatingLabel.text = result.rating.double + "/" + result.rating_top.double
    }

    func configureForCoreData(result: NSManagedObject) {
        gameImageView.kf.setImage(with: URL(string: result.value(forKey: "background_image") as? String ?? ""))
        gameNameLabel.text = result.value(forKey: "name") as? String
        gameRatingLabel.text = "\(result.value(forKey: "rating") ?? "")" + "/" + "\(result.value(forKey: "rating_top") ?? "")"
    }
}
