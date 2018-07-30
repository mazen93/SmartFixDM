//
//  OrderTypeModel.swift
//  SmartFix
//
//  Created by mac on 7/25/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation


import Realm
import RealmSwift

class OrderTypeModel {
    
    
    var id : Int
    var name : String=""
    
    init(name:String,id:Int) {
        self.id=id
        self.name=name
        
    }
}
