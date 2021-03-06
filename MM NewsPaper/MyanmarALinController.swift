//
//  MyanmarALinController.swift
//  MM NewsPaper
//
//  Created by WaiLynnZaw on 8/9/18.
//  Copyright © 2018 wailynnzaw. All rights reserved.
//

import UIKit
import WebKit
class MyanmarALinController: UIViewController, WKNavigationDelegate {
    var newsWeb: WKWebView!
    var pdfUrl = URL(string: "")
    let supportedSchemes = ["http", "https"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        newsWeb = WKWebView(frame: .zero, configuration: webConfiguration)
        newsWeb.navigationDelegate = self
        newsWeb.frame = self.view.frame
        self.view.addSubview(newsWeb)
        if let url = URL(string: getUrl()) {
            let request = URLRequest(url: url)
            newsWeb.load(request)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = getTitle()
        Utils().showProgressHUD(self.view)
    }
    
    func getTitle() -> String {
        return "မြန်မာ့အလင်း"
    }
    func getUrl() -> String {
        return "https://www.moi.gov.mm/mal/"
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        defer {
            decisionHandler(.allow)
        }
        guard
            navigationAction.navigationType == .linkActivated,
            let url = navigationAction.request.url,
            let scheme = url.scheme,
            supportedSchemes.contains(scheme)
        else {
            return
        }
        self.pdfUrl = url
        self.performSegue(withIdentifier: "pdfSegue", sender: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Utils().hideProgressHUD(self.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pdfSegue" {
            if let vc = segue.destination as? PDFViewController {
                vc.pdfURL = self.pdfUrl
            }
        }
    }
}

