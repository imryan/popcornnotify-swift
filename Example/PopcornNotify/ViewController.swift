//
//  ViewController.swift
//  PopcornNotify
//
//  Created by imryan on 03/04/2018.
//  Copyright (c) 2018 imryan. All rights reserved.
//

import UIKit
import PopcornNotify

class ViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup PopcornNotify with API key
        let notify = PopcornNotify(withAPIkey: "ryan:pwd")
        notify.notify(recipients: "notryancohen@gmail.com", "19088393634", message: "Hello, world!", subject: "Hello") { (error) in
            if let error = error {
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
