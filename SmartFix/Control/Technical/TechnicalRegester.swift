//
//  Registertechnically.swift
//  SmartFix
//
//  Created by tr on 7/17/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import WebKit

class TechnicalRegester: UIViewController,WKNavigationDelegate {
    
    //MARK:- Outlet
    @IBOutlet weak var mywebview: WKWebView!
    var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
     
        
   
        BackgroundProcess()
        
        
        setupView()
        
        
    }
    
    func activityIndicatorCall()  {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
    }
    func setupView()  {
        self.navigationItem.title="تسجيل دخول"
        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor=UIColor.white
    }
    func BackgroundProcess()  {
        DispatchQueue.global(qos: .background).async {
            //background code
            DispatchQueue.main.async {
              //  self.activityIndicatorCall()
                self.loadWebView()
            }
        }
    }
    func loadWebView(){
        let url = URL(string:  "http://www.smartfixsa.com/register/")
       
        mywebview.load(URLRequest(url: url!))
       
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicatorCall()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         activityIndicator.stopAnimating()
    }
    
    
    
}
