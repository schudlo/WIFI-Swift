//
//  ViewController.swift
//  WifiManager
//
//  Created by Andrii Shchudlo on 30.12.15.
//  Copyright © 2015 WarWar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let wiFiManager = WiFiManager.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("SSID: \(wiFiManager.getWiFiSSIDString())")
        print("MAC: \(wiFiManager.getWiFiRouterMACAdrress())")
    }
}

