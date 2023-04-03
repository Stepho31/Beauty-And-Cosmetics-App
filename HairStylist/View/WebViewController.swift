//
//  WebViewController.swift
//  HairStylist
//
//  Created by Stephen Byron on 3/1/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var websiteLink: URL?
    
    
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.openWebsite()
        }
        
    }
    
    func openWebsite() {
        DispatchQueue.main.async {
            let url = self.websiteLink!
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
    
}
