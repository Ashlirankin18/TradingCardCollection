//
//  Pokemon.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
struct Pokemon: Codable {
  let cards: [Card]
  
  struct Card: Codable {
    let name: String
    let imageUrl: URL
    let imageUrlHiRes: URL
    let attacks: [Attack]
    
    struct Attack: Codable {
      let name: String
      let damage: String
    }
  }
}
