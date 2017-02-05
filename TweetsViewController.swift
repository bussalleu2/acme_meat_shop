//
//  TweetsViewController.swift
//  ACME
//
//  Created by Alba on 4/2/17.
//  Copyright © 2017 bussalleu. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("appName", comment: "")
        webview.loadRequest(URLRequest(url: URL(string: Constants.baseURLTwitter)!))
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        self.progressView.setProgress(0.1, animated: false)
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        self.progressView.setProgress(1.0, animated: true)
        self.progressView.isHidden=true;
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        self.progressView.setProgress(1.0, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
