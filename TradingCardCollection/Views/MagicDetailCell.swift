//
//  MagicDetailCell.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MagicDetailCell: UICollectionViewCell {
  @IBOutlet weak var cardImage: UIImageView!
  @IBOutlet weak var cardName: UILabel!
  @IBOutlet weak var cardDescription: UITextView!
  @IBOutlet weak var cardLanguage: UILabel!
  override func prepareForReuse() {
    cardImage.image = nil
  }
}
