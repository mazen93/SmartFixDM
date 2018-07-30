//
//  OrderModel.swift
//  SmartFix
//
//  Created by mac on 7/22/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation

import Realm
import RealmSwift

class OrderModel:Object {

    @objc dynamic var phone:String? = nil
     let id = RealmOptional<Int>()
    
    override static func primaryKey() -> String {
        return "phone"
    }
    
}
extension OrderModel{
    func writeToRealm()  {
        try! uiRealm.write {
            uiRealm.add(self, update: true)
        }
    }
}

