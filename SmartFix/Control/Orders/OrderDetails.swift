//
//  OrderDetails.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import DropDown
import Realm
import RealmSwift
import CoreLocation


class OrderDetails: UIViewController,CLLocationManagerDelegate {

    var userList:Results<CentersModel>!
    
    var CenterLocation: CLLocation?
    
    var locationss=[CLLocation]()
    
    var userCurrentLocation:CLLocation!
    var locationManager:CLLocationManager!
    
    let animation = 0.0
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var stack2: UIStackView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var Tbv: UITableView!
    @IBOutlet weak var Tbv2: UITableView!
    var ref:DatabaseReference?
   
    @IBOutlet weak var orderbuttonVIew: UIButton!
    @IBOutlet weak var raal: UILabel!
    @IBOutlet weak var monthsLB: UILabel!
    
    var CentersList = [OrderTypeModel]()
    var IssueList = [OrderPartsModel]()
    var databaseRefrence:DatabaseReference?
  
    
    var orderKey:OrderModel!
    var partskey:OrderTypeModel!
    
  
  
   
    
  
    //MARK:- Outlet
    @IBOutlet weak var gerantyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
  
    @IBOutlet weak var orderButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        Tbv.isHidden = true
        Tbv2.isHidden = true
        
          getDataType()
          // print("ketyyyyyy= \(orderKey.id.value!)")
        determineMyCurrentLocation()
    }
    
    @IBAction func onclickbutton(_ sender: Any) {
        if Tbv.isHidden {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
        
        UIView.animate(withDuration: animation) {
            
            self.stack2.alpha = 0
            
            
        }
    }
    func animate(toogle:Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.Tbv.isHidden = false
            }
            
        } else {
            UIView.animate(withDuration: 0.3) {
                self.Tbv.isHidden = true
            }
            
        }
    }
    
    @IBAction func onclickbutton2(_ sender: Any) {
        if Tbv2.isHidden {
            pubic(toogle: true)
        } else {
            pubic(toogle: false)
        }
        
        
    }
    func pubic(toogle:Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.Tbv2.isHidden = false
            }
            
            
        } else {
            UIView.animate(withDuration: 0.3) {
                self.Tbv2.isHidden = true
            }
            
        }
    }
    
    

    func getDataType() {
        
        ref=Database.database().reference().child("phonetypes")
        let query=ref?.queryOrdered(byChild: "phoneid").queryEqual(toValue: orderKey.id.value!)
        query?.observe(.value) { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    
                    let artistObject = artists.value as? [String: AnyObject]
                    
                    let Name  = artistObject?["name"] as! String
                    let id = artistObject?["id"] as! Int
                    
                    // create Ream Object
                    let user=OrderTypeModel(name: Name, id: id)
                    
                    self.CentersList.append(user)
                }
                self.Tbv.reloadData()
                
                
                
            }
        }
        
    }
 
        
        

    
    // get data from firebase database
    func getDataissue(partkey:OrderTypeModel) {
        
        self.IssueList.removeAll()
        
        
        btn2.setTitle("النوع", for: .normal)
        databaseRefrence=Database.database().reference().child("parts")
        //  print(" id == \( CentersList.id)")
        //   databaseRefrence.queryOrderedByKey("phoneid").queryEqual(toValue: CentersList.id)
        
        let query=databaseRefrence?.queryOrdered(byChild: "phonetypesid").queryEqual(toValue:partskey.id)
        query?.observe(.value) { (snapshot) in
            
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                
                
                //iterating through all the values
                for snap in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                 //   print(snap)
                    let artistObject = snap.value as? [String: AnyObject]
                    
                   
                     let Name  = artistObject?["name"] as! String
                    //let id = artistObject?["id"] as! Int
                    
                    let price=artistObject?["price"] as! Int
                    let warrenty=artistObject?["warranty"] as! Int
                    // create Ream Object
                    
                    let user=OrderPartsModel(name: Name, warrenty: warrenty, price: price)
                    
                    self.IssueList.append(user)
                }
                self.Tbv2.reloadData()
                
                
                
            }
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setupView()  {
        self.navigationItem.title="طلب صيانة"
        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor=UIColor.white
    }
        
    
    
   
   
    

    
    
    
        
    
    
    @IBAction func orderButtonClick(_ sender: Any) {
        
      
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "orderCenterOrder") as? orderCenterOrder
            vc?.CenterLocation=CenterLocation
       
        self.navigationController?.pushViewController(vc!, animated: true)
    }
   











    
    //loc
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        userCurrentLocation=userLocation
        
        
       // print("user latitude = \(userLocation.coordinate.latitude)")
       // print("user longitude = \(userLocation.coordinate.longitude)")
        
        getData2()
        
    }
    
    // location
    
    func locationInLocations(locations: [CLLocation], closestToLocation location: CLLocation) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        
        var closestLocation: CLLocation?
        var smallestDistance: CLLocationDistance?
        
        for locationn in locations {
            let distance = location.distance(from: locationn)
            if smallestDistance == nil || distance < smallestDistance! {
                closestLocation = locationn
                smallestDistance = distance
            }
        }
        

        
       // print("closestLocation: \(closestLocation!), distance: \(smallestDistance!)")
       
        CenterLocation=closestLocation!
        getCenterData(loca: CenterLocation!)
        
        
        
        return closestLocation
    }
    
    
    
    
    func getlocation(userLocation:CLLocation)  {
        
        let userL=CLLocation(latitude: userCurrentLocation.coordinate.latitude, longitude:  userCurrentLocation.coordinate.longitude)
        
        
        
        //print("userrrrrr\(userCurrentLocation.coordinate.latitude,userCurrentLocation.coordinate.longitude)")
        
        
        
        locationInLocations(locations: locationss, closestToLocation: userL)
        
    }
    
    
    
    func getData2() {
        
        ref = Database.database().reference().child("service_centers")
        
        //observing the data changes
        ref?.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    
                    
                    
                    
                    let artistObject = artists.value  as? [String: AnyObject]
                    
                    
                    
                    
                    
                    let lat  = artistObject?["lat"] as! Double
                    let lng  = artistObject?["lng"] as! Double
                    
                    let user=LatLngModel(lat:lat, lng: lng)
                    
                    self.locationss.append(CLLocation(latitude: lat, longitude: lng))
                    
                  //  print(self.locationss)
                    
                    // self.getLatLng.append(user)
                    
                    // print(self.locations)
                    
                }
                self.getlocation(userLocation:self.userCurrentLocation)
                
                
            }
            
        })
    }

    
    
    ///get Center data
    
    
    
    func getCenterData(loca:CLLocation) {
        
        let lat=loca.coordinate.latitude
        let lng=loca.coordinate.longitude
      //  print(lat)
       // print(lng)
        ref = Database.database().reference().child("service_centers")
        let querey=ref?.queryOrdered(byChild: "lat").queryEqual(toValue:lat).ref.queryOrdered(byChild: "lng").queryEqual(toValue:lng)
        
        querey?.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                        let artistObject = artists.value  as? [String: AnyObject]
                        
                        
                        let CenterName  = artistObject?["name"] as! String
                        let CenterAddress = artistObject?["address"] as! String
                        let CenterService  = artistObject?["the_service"] as! String
                        
                        
                        // create Ream Object
                        let user=CentersModel()
                        
                        user.name=CenterName
                        user.addres=CenterAddress
                        user.service=CenterService
                        user.lat.value=lat
                        user.lng.value=lng
                    
                    
                    
                    
                    //print("CenterNameee\(CenterName))")
                        user.writeToRealm()
                        
                        //appending it to list
                        self.reloadData()
                        
                    }
                    
                    
                    
                }
                
            })
        }
        
        
        
        func reloadData()  {
            userList=uiRealm.objects(CentersModel.self)
            
        }


   

}

extension OrderDetails:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == Tbv {
            return CentersList.count
        } else{
            return IssueList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if tableView == Tbv {
            cell.textLabel?.text = CentersList[indexPath.row].name
            return cell
        } else {
            cell.textLabel?.text = IssueList[indexPath.row].name
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == Tbv {
            btn.setTitle("\(CentersList[indexPath.row].name)", for: .normal)
            partskey=CentersList[indexPath.row]
            print(CentersList[indexPath.row].name)
            
            
            getDataissue(partkey: CentersList[indexPath.row])
          //  getDataissue(CentersList[indexPath.row].id)
            animate(toogle: false)
            UIView.animate(withDuration: animation) {
                
                self.stack2.alpha = 1
                
                
            }
        } else {
            btn2.setTitle("\(IssueList[indexPath.row].name)", for: .normal)
            
            
            monthsLB.alpha=1
            raal.alpha=1
            gerantyLabel.alpha=1
            priceLabel.alpha=1
            gerantyLabel.text=String(IssueList[indexPath.row].warrenty)
            priceLabel.text=String(IssueList[indexPath.row].price)
            orderbuttonVIew.alpha=1
            
            
            pubic(toogle: false)
            
        }
    }
   
    
    
    
    
}
