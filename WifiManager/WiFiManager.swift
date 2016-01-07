//
//  WiFiManager.swift
//  WifiManager
//
//  Created by Andrii Shchudlo on 30.12.15.
//  Copyright © 2015 WarWar. All rights reserved.
//

import UIKit
import NetworkExtension
import SystemConfiguration.CaptiveNetwork

class WiFiManager: NSObject
{
    class var sharedInstance: WiFiManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WiFiManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WiFiManager()
        }
        return Static.instance!
    }
    
    func getWiFiSSIDString() -> String
    {
        let interfaces:CFArray! = CNCopySupportedInterfaces()
        for i in 0..<CFArrayGetCount(interfaces)
        {
            let interfaceName: UnsafePointer<Void> = CFArrayGetValueAtIndex(interfaces, i)
            let rec = unsafeBitCast(interfaceName, AnyObject.self)
            let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)")
            if unsafeInterfaceData != nil {
                let interfaceData = unsafeInterfaceData! as Dictionary!

                return interfaceData["SSID"] as! String
            }
            else
            {
                return ""
            }
        }
        return ""
    }
    
    func getWiFiRouterMACAdrress() -> String
    {
        let ipAddress = WifiIPManager.sharedInstance.getRouterMacAddressString()
        return ipAddress
    }
}
