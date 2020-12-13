//
//  SecondViewController.swift
//  MM NewsPaper
//
//  Created by WaiLynnZaw on 8/9/18.
//  Copyright © 2018 wailynnzaw. All rights reserved.
//

import UIKit

class KyayMonController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!
    var url: String = "https://www.moi.gov.mm/km/"
    var pdfUrl = URL(string: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "ေၾကးမုံ"
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        if navigationType == UIWebView.NavigationType.linkClicked {
            self.pdfUrl = request.url
            self.performSegue(withIdentifier: "pdfSegue", sender: nil)
            return false
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pdfSegue" {
            if let vc = segue.destination as? PDFViewController {
                vc.pdfURL = self.pdfUrl
            }
        }
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils().hideProgressHUD(self.view)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils().showProgressHUD(self.view)
    }


}

