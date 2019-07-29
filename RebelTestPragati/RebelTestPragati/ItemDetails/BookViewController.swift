//
//  BookViewController.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 21/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import UIKit
import WebKit

class BookViewController: UIViewController {
    @IBOutlet weak var bookWebKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookWebKitView.load(URLRequest(url: URL(string:currentResult!.url)!))
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
