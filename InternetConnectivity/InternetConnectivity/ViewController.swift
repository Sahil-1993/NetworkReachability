//
//  ViewController.swift
//  InternetConnectivity
//
//  Created by Sahil Arora on 2020-11-17.
//  Copyright © 2020 Sahil Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if NetworkConnection.sharedInstance.isConnected
        {
            print("Connected")
            self.view.backgroundColor = .green
        }
        else
        {
              self.view.backgroundColor = .red
            print("not connected")
        }
    }


}

