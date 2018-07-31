//
//  ReguestOrder.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import Firebase
import SafariServices
class ReguestOrder: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var ref: DatabaseReference!
    var OrderList:Results<OrderModel>!
    
    
    @IBOutlet weak var collectioV1: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setCollectionView()
       BackgroundProcess()
}
    func setCollectionView(){
        collectioV1.dataSource = self
        collectioV1.delegate = self
        self.navigationItem.title="طلب صيانة"
        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor=UIColor.white
    }
    
    
    func BackgroundProcess() {
        DispatchQueue.global(qos: .background).async {
            //background code
            DispatchQueue.main.async {
                self.getDatabase()
               // self.getnewData()
            }
        }
    }
    

    
    // get data from firebase database
    func getDatabase() {
        
        ref=Database.database().reference().child("phones");
        ref.observe(.value) { (snapshot) in
            
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                
                
                //iterating through all the values
                for snap in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let artistObject = snap.value as? [String: AnyObject]
                    
                    let Name  = artistObject?["name"] as! String
                    let id = artistObject?["id"] as! Int
                    
                    
                    
                    // create Ream Object
                    let user=OrderModel()
                    user.phone=Name
                    user.id.value=id
                    
                    user.writeToRealm()
                    
                    //appending it to list
                    self.reloadData()
                    
                }
                
                
                
            }
            
        }
        
        
        
    }
    func reloadData()  {
        OrderList=uiRealm.objects(OrderModel.self)
        self.collectioV1.reloadData()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if OrderList != nil{
            return OrderList.count
        }else{
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectioV1.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! orderCelll
        
        
        cell.set(center: OrderList[indexPath.row] )
        
     
    

    return cell
        
        
        
        
}

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // let vc = storyboard?.instantiateViewController(withIdentifier: "OrderDetails") as? OrderDetails
        if OrderList[indexPath.row].phone == "iPhone"{
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderDetails") as? OrderDetails
        vc?.orderKey=OrderList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            
                    let vc=SFSafariViewController(url: URL(string: "http://www.smartfixsa.com/maintenance/")!)
                    self.present(vc, animated: true, completion: nil)
        }
    }
    
   

    
    
    
    
    
}
