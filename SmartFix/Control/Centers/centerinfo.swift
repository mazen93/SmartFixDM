//
//  centerinfo.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import MapKit
class centerinfo: UIViewController {
    

    
    
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var ServiceLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var CentersList : CentersModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        setUpView()
        setData()
        
    }
    @IBAction func GoButtonAction(_ sender: Any) {
        
        lunchToMap()
    }
    
    
    func lunchToMap() {
        let lat:CLLocationDegrees=CentersList.lat.value!
        let long:CLLocationDegrees=CentersList.lng.value!
        
        let regionDistance:CLLocationDistance=1000
        let coordinates=CLLocationCoordinate2DMake(lat, long)
        let regionSpan=MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Me"
        mapItem.openInMaps(launchOptions: options)
    }
    func setUpView(){
        
        // GoButton.layer.cornerRadius =  GoButton.frame.size.width/2
        GoButton.layer.cornerRadius = 20
        GoButton.layer.borderWidth = 2
        GoButton.layer.borderColor = UIColor.white.cgColor
        
         self.navigationItem.title=CentersList.name
         self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
         self.navigationController?.navigationBar.tintColor=UIColor.white
        
    }
    func setData() {
        
        ServiceLabel.text = CentersList.service
        AddressLabel.text = CentersList.addres
    }

  

}
