//
//  MagicGatheringVC.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MagicGatheringVC: UIViewController {
  @IBOutlet weak var magicGatheringCollectionView: UICollectionView!
  
  private var cards = [Cards](){
    didSet{
      DispatchQueue.main.async {
        self.magicGatheringCollectionView.reloadData()
      }
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      getCards()
      magicGatheringCollectionView.dataSource = self
      magicGatheringCollectionView.delegate = self
    }
  private func getCards(){
    TradingCardApiClient.getMagicGatheringCards { (error, cards) in
      if let cards = cards {
        self.cards = cards
        dump(cards)
      }
      if let error = error{
        print(error.errorMessage())
      }
    }
  }
  private func getCardImages(imageUrl:URL,imageView:UIImageView){
    ImageHelper.shared.fetchImage(urlString: imageUrl.absoluteString) { (error, image) in
      if let error = error{
        print(error.errorMessage())
      }
      if let image = image {
        DispatchQueue.main.async {
          imageView.image = image
        }
        }
      }
    }
  }
  

extension MagicGatheringVC:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cards.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = magicGatheringCollectionView.dequeueReusableCell(withReuseIdentifier: "magicCell", for: indexPath) as? MagicGatherCell else {return UICollectionViewCell()}
    if let image = cards[indexPath.row].imageUrl{
      getCardImages(imageUrl: image, imageView: cell.cardImage)
    }
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
    guard let viewController = storyBoard.instantiateViewController(withIdentifier: "magicController1") as? MagicGatheringDetailled else {return}
    self.present(viewController, animated: true, completion: nil)
    viewController.card = cards[indexPath.row]
    
  }
  
}
extension MagicGatheringVC:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 130, height: 200)
  }
  
}
