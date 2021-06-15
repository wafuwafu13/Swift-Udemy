//
//  ViewController.swift
//  Swift6WKWebView1
//
//  Created by 田川　裕隆 on 2021/06/10.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webView = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
}

