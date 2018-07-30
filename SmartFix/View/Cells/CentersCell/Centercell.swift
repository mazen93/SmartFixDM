//
//  firstpagecell.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit

class Centercell: UITableViewCell {

    @IBOutlet weak var CenterName: UILabel!
//    @IBOutlet weak var CenterId: UILabel!
//    @IBOutlet weak var CenterAddres: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(center:CentersModel){
          CenterName.text = center.name
 //       CenterAddres.text = center.addres
//        CenterId.text = center.id
    }

}
