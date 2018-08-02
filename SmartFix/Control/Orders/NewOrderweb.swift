//
//  NewOrderweb.swift
//  SmartFix
//
//  Created by mac on 7/29/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit
import WebKit
class NewOrderweb: UIViewController,WKNavigationDelegate{
    //MARK:- Outlet
    @IBOutlet weak var mywebview: WKWebView!
    var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        BackgroundProcess()
        
        
        setupView()
        
        
    }
  
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         print(error.localizedDescription)
    }
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finish to load")
    }
    
    func activityIndicatorCall()  {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
    }
    
    func setupView()  {
        self.navigationItem.title="طلب صيانة"
        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor=UIColor.white
    }
    
    func BackgroundProcess()  {
        DispatchQueue.global(qos: .background).async {
            //background code
            DispatchQueue.main.async {
                self.activityIndicatorCall()
                self.loadWebView()
            }
        }
    }
    func loadWebView()
      {
        let url = URL(string:  "http://www.smartfixsa.com/maintenance/")
        mywebview.load(URLRequest(url: url!))
        activityIndicator.stopAnimating()
       }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      //  activityIndicatorCall()
    }
}
