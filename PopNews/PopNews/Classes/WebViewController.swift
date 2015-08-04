//
//  WebViewController.swift
//  PopNews
//
//  Created by 曹亚民 on 15/8/4.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {
    
    var shouldLoadUrl:String?
    var loading:UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let webview = UIWebView(frame:self.view.bounds)
        webview.bounds=self.view.bounds
        webview.delegate=self
        self.view.addSubview(webview)
        println(shouldLoadUrl)
        loading=UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        loading?.frame=CGRectMake((WIDTH-150)/2, (HEIGHT-44)/2, 150, 150)
        self.view.addSubview(loading!)
        
        if (shouldLoadUrl?.isEmpty != nil) {
            loading?.startAnimating()
           webview.loadRequest(NSURLRequest(URL: NSURL(string:shouldLoadUrl!)!))
            
        }
        // Do any additional setup after loading the view.
    }

    func webViewDidStartLoad(webView: UIWebView) {
        //println("webViewDidStartLoad")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        //println("webViewDidFinishLoad")
         loading?.stopAnimating()
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.clearAllNotice()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
