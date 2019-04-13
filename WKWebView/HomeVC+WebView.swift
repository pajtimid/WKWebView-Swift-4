//
//  HomeVC+WebView.swift
//  WKWebView
//
//  Created by Pajtim on 14.04.19.
//  Copyright © 2019 Pajtim. All rights reserved.
//


import Foundation
import WebKit

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            load(request)
        }
    }
}

extension HomeVC {
    
    //    Called when web content begins to load in a web view.
    func webView(_ webView: WKWebView, didStartProvisionalNavigation: WKNavigation!) {
        self.showHUD(progressLabel: "Loading...")
    }
    
    //Called when an error occurs during navigation.
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.dismissHUD(isAnimated: true)
        showAlert()
    }
    
    //    Called when an error occurs while the web view is loading content.
    func webView(_ webView:WKWebView, didFailProvisionalNavigation: WKNavigation!, withError: Error) {
        dismissHUD(isAnimated: true)
        showAlert()
    }
    
    //    Called when the navigation is complete.
    func webView(_ webView: WKWebView, didFinish: WKNavigation!) {
        dismissHUD(isAnimated: true)
    }
    
    
}
