//
//  orderCelll.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import Kingfisher
class orderCelll: UICollectionViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    
    func set(center:OrderModel){
        
        
        
        
        title.text=center.phone
       // imgcell.image = center.photo
        //       CenterAddres.text = center.addres
        //        CenterId.text = center.id
          // imgcell.image = UIImage(named: String(#imageLiteral(resourceName: "imageee")))
        
        
//        let url=center.photo
//        //imgcell.kf.setImage(with: (center.photo as! Resource))
//
//        imgcell.kf.setImage(with: url as! Resource,
//                                  placeholder: nil,
//                                  options: [.transition(ImageTransition.fade(1))]
//        )
//
}
}
