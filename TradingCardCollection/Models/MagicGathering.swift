//
//  MagicGathering.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct MGCards:Codable {
  let cards: [Cards]
}
struct Cards:Codable{
  let name:String
  let imageUrl:URL?
  let text: String
  let foreignNames:[ForeignDetails]
}
struct ForeignDetails:Codable {
  let name:String
  let text:String
  let imageUrl:URL?
  let language:String
  
  
}
