//
//  StoreModel.swift
//  SmartFix
//
//  Created by mac on 7/18/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class StoreModel:Object {
    
//    var id : String = ""
//    var title : String = ""
//    var company : String = ""
//    var photo : String = ""
//    var price : String = ""
//
//
//    init(id:String,title:String,company:String,price:String ) {
//         self.id=id
//         self.title=title
//         self.price=price
//         self.company=company
//        // self.photo=photo
//    }
//
   
    @objc dynamic var title = ""
    @objc dynamic var picture=""
     let price = RealmOptional<Int>()
    override static func primaryKey() -> String {
        return "title"
    }
    
}
extension StoreModel{
    func writeToRealm()  {
        try! uiRealm.write {
            uiRealm.add(self, update: true)
        }
    }
}

