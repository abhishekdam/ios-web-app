//
//  ViewController.swift
//  WKWebviewProject
//
//  Created by Mahesh Kumawat on 28/01/23.
//

import UIKit
import WebKit

class ViewController: UIViewController,UIWebViewDelegate,WKNavigationDelegate, WKUIDelegate {
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        let webConfiguration = WKWebViewConfiguration()
        if #available(iOS 10.0, *) {
            webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        }
        webConfiguration.allowsInlineMediaPlayback = true
//        let webView = WKWebView(frame: frame, configuration: configuration)
//        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        if #available(iOS 16.4, *) {
            webView.isInspectable = true
        } else {
            // Fallback on earlier versions
        }
        super.viewDidLoad()
        webview.uiDelegate = self
        webview.navigationDelegate = self
        let urlString = "https://www.youtube.com/embed/9n1e1N0Sa9k?playsinline=1"
        webview.load(URLRequest.init(url: URL(string: urlString)!))
        // Do any additional setup after loading the view.
    }
    

    //MARK: Webview delegate methods
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished")
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start")
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(webview.url?.absoluteString)
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print(webview.url?.absoluteString)
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil{
            UIApplication.shared.open(navigationAction.request.url!)
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
   

}

