//
//  MagicGatheringDetailled.swift
//  TradingCardCollection
//
//  Created by Ashli Rankin on 1/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MagicGatheringDetailled: UIViewController {
  var card: Cards?

  @IBOutlet weak var magicCollectionView: UICollectionView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    magicCollectionView.dataSource = self
    magicCollectionView.delegate = self
    }
  private func setTheImages(url:URL,imageView:UIImageView){
    ImageHelper.shared.fetchImage(urlString: url.absoluteString) { (error, image) in
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
  @IBAction func buttonPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  

   
}
extension MagicGatheringDetailled:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let foreignInfo = card?.foreignNames else {fatalError()}
    return foreignInfo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let foreignCardInfo = card?.foreignNames[indexPath.row]
    else {return UICollectionViewCell()}
    guard let cell = magicCollectionView.dequeueReusableCell(withReuseIdentifier: "magicCell2", for: indexPath) as? MagicDetailCell else {return UICollectionViewCell()}
    cell.cardName.text = foreignCardInfo.name.capitalized
    cell.cardLanguage.text = foreignCardInfo.language.capitalized
    cell.cardDescription.text = foreignCardInfo.text.capitalized
    if let imageUrl = foreignCardInfo.imageUrl{
      setTheImages(url: imageUrl, imageView: cell.cardImage)
    }
    return cell
  }
}
extension MagicGatheringDetailled:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 300, height: 400)
  }
}
