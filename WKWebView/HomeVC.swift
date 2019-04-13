//
//  ViewController.swift
//  WKWebView
//
//  Created by Pajtim on 14.04.19.
//  Copyright © 2019 Pajtim. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class HomeVC: UIViewController, WKNavigationDelegate {
    
    //   let webView = WKWebView()
    @IBOutlet weak var webView: WKWebView!
    //    override func loadView() {
    //        self.view = webView
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setTitleLabel()
        webView.navigationDelegate = self
        self.navigationController?.navigationBar.topItem?.title = "Github"
        webView.load("https://github.com")
    }
    
    func setTitleLabel() {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "GitHub"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Can't load data. Please check your internet connection!", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func goBackAction(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goForwoardAction(_ sender: Any) {
        webView.goForward()
    }
    
}

extension UIViewController {
    
    func showHUD(progressLabel:String){
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.label.text = progressLabel
    }
    
    func dismissHUD(isAnimated:Bool) {
        MBProgressHUD.hide(for: self.view, animated: isAnimated)
    }
}
