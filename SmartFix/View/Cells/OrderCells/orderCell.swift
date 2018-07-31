//
//  orderCell.swift
//  SmartFix
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
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

