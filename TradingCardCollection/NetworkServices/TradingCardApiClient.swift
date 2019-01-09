//
//  TradingCardApiClient.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
final class TradingCardApiClient{
  static func getPokemonCards(completionHandler: @escaping (AppError?,[Cards]?)-> Void){
    let urlString = " https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks"
    NetworkHelper.shared.performDataTask(endpointURLString: <#T##String#>, completionHandler: <#T##(AppError?, Data?, HTTPURLResponse?) -> Void#>)
  }
  static func getMagicGatheringCards(completionHandler: @escaping (AppError?,[MgCards]?) -> Void){
    NetworkHelper.shared.performDataTask(endpointURLString: <#T##String#>, completionHandler: <#T##(AppError?, Data?, HTTPURLResponse?) -> Void#>)
  }
}
