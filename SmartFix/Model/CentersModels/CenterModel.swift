//
//  CenterModel.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CentersModel:Object {
    
//    //var id : String = ""
//    var name : String = ""
//    var addres : String = ""
//    var service:String=""
//
//    init(name:String,addres:String,service:String) {
//       // self.id=id
//        self.name=name
//        self.addres=addres
//        self.service=service
//    }
//}
    @objc dynamic var name:String? = nil
    @objc dynamic var addres:String? = nil
    @objc dynamic var service:String? = nil
    @objc dynamic var photo:String? = nil
    let lat = RealmOptional<Double>()
    let lng = RealmOptional<Double>()
    
  
    
    
    
    override static func primaryKey() -> String {
        return "name"
    }
    
}
extension CentersModel{
    func writeToRealm()  {
        try! uiRealm.write {
            uiRealm.add(self, update: true)
        }
    }
}
    

