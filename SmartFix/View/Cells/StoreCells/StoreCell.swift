//
//  StoreCell.swift
//  SmartFix
//
//  Created by mac on 7/18/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import Kingfisher
class StoreCell: UICollectionViewCell {
    
      @IBOutlet weak var title: UILabel!
      @IBOutlet weak var id: UILabel!
      @IBOutlet weak var company: UILabel!
      @IBOutlet weak var photo: UIImageView!
      @IBOutlet weak var price: UILabel!
    
    func set(store:StoreModel){
        title.text = store.title
      
        price.text=String(describing: store.price.value!)
       
        let url = URL(string: store.picture)
         photo.kf.setImage(with: url)
        
     //   photo.text = store.photo
        
        
        
    }
    
}
