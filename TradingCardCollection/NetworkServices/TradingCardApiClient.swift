//
//  TradingCardApiClient.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import Foundation
final class TradingCardApiClient{
 static func getMagicGatheringCards(completionHandler: @escaping (AppError?,[Cards]?) -> Void){
  let urlString = "https://api.magicthegathering.io/v1/cards?contains=imageUrl"
  NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data, httpResponse) in
    if let error = error{
      completionHandler(AppError.badURL(error.errorMessage()),nil)
    }
    if let data = data {
      do{
        let cards = try JSONDecoder().decode(MGCards.self, from: data).cards.filter{$0.imageUrl != nil}
        completionHandler(nil,cards)
      } catch {
        completionHandler(AppError.decodingError(error),nil)
      }
    }
  }
  }
  static func getPokemonCards(completionHandler: @escaping (AppError?,[Pokemon]?)-> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks") { (appError, data, httpResponse) in
      if let appError = appError {
        completionHandler(AppError.badURL(appError.errorMessage()), nil)
      }
      if let data = data {
        do {
          let pokemon =  try JSONDecoder().decode(Pokemon.self, from: data)
          completionHandler(nil, [pokemon])
        } catch {
          completionHandler(AppError.decodingError(error), nil)
        }
      }
    }
  }
}
